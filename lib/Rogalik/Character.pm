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

has id => (
    is       => 'ro',
    isa      => 'Int',
    required => 1,
#    trigger  => \&initialize,
);

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
    isa     => 'HashRef[Str|Int]',
    lazy    => 1,
    builder => '_class',
);

sub _class {
    my $self = shift;
    my( $res, $rows, $rv ) = Rogalik::DB->execute(
        "select c.id, c.name as class from theClass c, theCharacter ch where ch.id = @{[$self->id]} and ch.class = c.id"
    );
    return { id => $res->[0]->{id}, name => $res->[0]->{class} };
}

has level => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_level',
    trigger => \&_db_sync,
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
    if( $self->level > $self->basics->playerMaxLevel ) {
        return '***WINNER***';
    }
    else {
        my $titleIdx = int( ( $self->level - 1 ) / 5 ) + 1;
        my( $res, $rows, $rv ) = Rogalik::DB->execute(
            "select t.name from Title t, theClass c, theCharacter ch where t.idx = $titleIdx and t.class = c.id and c.id = ch.class and ch.id = @{[$self->id]}"
        );

        return $res->[0]->{name};
    }
}

sub _db_sync {
    my( $self, $new, $old ) = @_;
    my( undef, undef, undef, $caller ) = caller( 1 );
    my( $field ) = $caller =~ m/Rogalik::Character::(\w+)$/;
    Rogalik::DB->set( 'theCharacter', $field, "'$new'", $self->id );
    Rogalik::DB->set( 'theCharacter', 'updated', "datetime( 'now' )", $self->id );
}

#sub initialize {
#    my $self = shift;
#
#    $self->name( Rogalik::DB->get( 'theCharacter', 'name', $self->id ) );
#}

no Moose;
__PACKAGE__->meta->make_immutable;
