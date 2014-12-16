package Rogalik::Character;
#===============================================================================
#         FILE:  Character.pm
#
#  DESCRIPTION:  Class for character
#
#===============================================================================

use strict;
use warnings;

use 5.010;
use Moose;

use Data::Dumper;
use Rogalik::DB;
use Rogalik::Basics;
use Rogalik::PClass;

has id => (
    is       => 'ro',
    isa      => 'Int',
    required => 1,
    initializer => '_set_race_class_values',
);

sub _set_race_class_values {
    my $self = shift;

    # check lvl - it's my flag for fresh char
    unless( Rogalik::DB->get( 'theCharacter', 'lvl', $self->id ) ) {
        # populate lvl
        Rogalik::DB->set( 'theCharacter', 'lvl', 1, $self->id );

        # chp, mhp with data depending on race, class
        my $raceMhp  = Rogalik::DB->get( 'theRace',  'hp', $self->race->{id} );
        my $classMhp = Rogalik::DB->get( 'theClass', 'hp', $self->class->id );
        Rogalik::DB->set( 'theCharacter', 'mhp', ($raceMhp + $classMhp), $self->id );
        Rogalik::DB->set( 'theCharacter', 'chp', ($raceMhp + $classMhp), $self->id );

        # cmp, mmp with data depending on race, class
        if( $self->class->magicless or $self->class->first_spell_lvl > 1 ) {
            Rogalik::DB->set( 'theCharacter', 'mmp', 0, $self->id );
            Rogalik::DB->set( 'theCharacter', 'cmp', 0, $self->id );
        }
        else {
            my $mmp = 1;
            # TODO: calculate mana
            # early at the moment

            Rogalik::DB->set( 'theCharacter', 'mmp', $mmp, $self->id );
            Rogalik::DB->set( 'theCharacter', 'cmp', $mmp, $self->id );
        }
    }
}

has basics => (
    is      => 'ro',
    isa     => 'Rogalik::Basics',
    lazy    => 1,
    builder => '_basics',
);

sub _basics {
    return Rogalik::Basics->new;
}

has name => (
    is      => 'rw',
    isa     => 'Str',
    lazy    => 1,
    builder => '_name',
    trigger => \&_db_sync,
);

sub _name {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'name', $self->id ) || '';
}

has sex => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    builder => '_sex',
);

sub _sex {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'sex', $self->id );
}

has race => (
    is      => 'ro',
    isa     => 'HashRef[Str|Int]',
    lazy    => 1,
    builder => '_race',
);

sub _race {
    my $self = shift;
    my( $res, $rows, $rv ) = Rogalik::DB->execute(
        "select r.id, r.name as race from theRace r, theCharacter ch where ch.id = @{[$self->id]} and ch.race = r.id"
    );
    return { id => $res->[0]->{id}, name => $res->[0]->{race} };
}

has class => (
    is      => 'ro',
    isa     => 'Rogalik::PClass',
    lazy    => 1,
    builder => '_class',
);

sub _class {
    my $self = shift;
    my( $res, $rows, $rv ) = Rogalik::DB->execute( "select class from theCharacter where id = ". $self->id );
    return Rogalik::PClass->new( id => $res->[0]->{class} );
}

has lvl => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_level',
    trigger => \&_db_sync,
    documentation => q(Player's level),
);

sub _level {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'lvl', $self->id );
}

has title => (
    is      => 'rw',
    isa     => 'Str',
    lazy    => 1,
    builder => '_title',
);

sub _title {
    my $self = shift;
    if( $self->lvl > $self->basics->playerMaxLevel ) {
        return '***WINNER***';
    }
    else {
        my $titleIdx = int( ( $self->lvl - 1 ) / 5 ) + 1;
        my( $res, $rows, $rv ) = Rogalik::DB->execute(
            "select t.name from Title t, theClass c, theCharacter ch where t.idx = $titleIdx and t.class = c.id and c.id = ch.class and ch.id = @{[$self->id]}"
        );

        return $res->[0]->{name};
    }
}

has chp => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_chp',
#    trigger => \&_db_sync,
    documentation => q[Current hit points],
);

sub _chp {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'chp', $self->id );
}

has mhp => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_mhp',
    trigger => \&_db_sync,
    documentation => q[Max hit points],
);

sub _mhp {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'mhp', $self->id );
}

has cmp => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_cmp',
#    trigger => \&_db_sync,
    documentation => q[Current mana points],
);

sub _cmp {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'cmp', $self->id );
}

has mmp => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_mmp',
    trigger => \&_db_sync,
    documentation => q[Max mana points],
);

sub _mmp {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'mmp', $self->id );
}

sub _db_sync {
    my( $self, $new, $old ) = @_;
    my( undef, undef, undef, $caller ) = caller( 1 );
    my( $field ) = $caller =~ m/Rogalik::Character::(\w+)$/;
    Rogalik::DB->set( 'theCharacter', $field, "'$new'", $self->id );
    Rogalik::DB->set( 'theCharacter', 'updated', "datetime( 'now', 'localtime' )", $self->id );
}

no Moose;
__PACKAGE__->meta->make_immutable;
