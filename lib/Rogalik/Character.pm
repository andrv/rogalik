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
use Rogalik::Race;
use Rogalik::PClass;
use Rogalik::Tools;

has id => (
    is       => 'ro',
    isa      => 'Int',
    required => 1,
    initializer => '_birth',
);

sub _birth {
    my $self = shift;

    # check lvl - it's my flag for fresh char
    unless( Rogalik::DB->get( 'theCharacter', 'lvl', $self->id ) ) {
        # populate lvl
        Rogalik::DB->set( 'theCharacter', 'lvl', 1, $self->id );

        # chp, mhp with data depending on race, class
        my $hp = $self->race->hp + $self->class->hp;
        Rogalik::DB->set( 'theCharacter', 'mhp', $hp, $self->id );
        Rogalik::DB->set( 'theCharacter', 'chp', $hp, $self->id );

        # cmp, mmp with data depending on class
        my $mana;
        if( $self->class->magicless or $self->class->first_spell_lvl > 1 ) {
            $mana = 0;
        }
        else {
            $mana = 1;
            # TODO: calculate mana
            # early at the moment

        }
        Rogalik::DB->set( 'theCharacter', 'mmp', $mana, $self->id );
        Rogalik::DB->set( 'theCharacter', 'cmp', $mana, $self->id );

        # age
        my $age = $self->race->age + Rogalik::Tools->randint1( $self->race->age_mod );
        Rogalik::DB->set( 'theCharacter', 'age', $age, $self->id );

        my( $height, $weight ) = ( 0, 0 );
        if( $self->sex eq 'Male' ) {
            $height = $self->race->height_male + Rogalik::Tools->randint0( $self->race->height_male_mod );
            $weight = $self->race->weight_male + Rogalik::Tools->randint0( $self->race->weight_male_mod );
        }
        elsif( $self->sex eq 'Female' ) {
            $height = $self->race->height_female + Rogalik::Tools->randint0( $self->race->height_male_mod );
            $weight = $self->race->weight_female + Rogalik::Tools->randint0( $self->race->weight_female_mod );
        }
        else {
            # neuter - inbetween
            $height = ( $self->race->height_male + $self->race->height_female ) / 2 + Rogalik::Tools->randint0(
                ( $self->race->height_male_mod + $self->race->height_female_mod ) / 2 );
            $weight = ( $self->race->weight_male + $self->race->weight_female ) / 2 + Rogalik::Tools->randint0(
                ( $self->race->weight_male_mod + $self->race->weight_female_mod ) / 2 );
        }
        Rogalik::DB->set( 'theCharacter', 'height', $height, $self->id );
        Rogalik::DB->set( 'theCharacter', 'weight', $weight, $self->id );

        # turns
        Rogalik::DB->set( 'theCharacter', 'turn', 1, $self->id );
        Rogalik::DB->set( 'theCharacter', 'played_turns', 0, $self->id );
        Rogalik::DB->set( 'theCharacter', 'rested_turns', 0, $self->id );

        # strength, intelligence etc
        Rogalik::DB->set( 'theCharacter', 's_str', 10, $self->id );
        Rogalik::DB->set( 'theCharacter', 's_int', 10, $self->id );
        Rogalik::DB->set( 'theCharacter', 's_wis', 10, $self->id );
        Rogalik::DB->set( 'theCharacter', 's_dex', 10, $self->id );
        Rogalik::DB->set( 'theCharacter', 's_con', 10, $self->id );
        Rogalik::DB->set( 'theCharacter', 'e_str', 0, $self->id );
        Rogalik::DB->set( 'theCharacter', 'e_int', 0, $self->id );
        Rogalik::DB->set( 'theCharacter', 'e_wis', 0, $self->id );
        Rogalik::DB->set( 'theCharacter', 'e_dex', 0, $self->id );
        Rogalik::DB->set( 'theCharacter', 'e_con', 0, $self->id );
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
    isa     => 'Rogalik::Race',
    lazy    => 1,
    builder => '_race',
);

sub _race {
    my $self = shift;
    my( $res, $rows, $rv ) = Rogalik::DB->execute( "select race from theCharacter where id = ". $self->id );
    return Rogalik::Race->new( id => $res->[0]->{race} );
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
    documentation => q[Player's level],
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

has age => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_age',
    trigger => \&_db_sync,
);

sub _age {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'age', $self->id );
}

has height => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_height',
    trigger => \&_db_sync,
);

sub _height {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'height', $self->id );
}

has weight => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_weight',
    trigger => \&_db_sync,
);

sub _weight {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'weight', $self->id );
}

has turn => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_turn',
);

sub _turn {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'turn', $self->id );
}

has played_turns => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_played_turns',
);

sub _played_turns {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'played_turns', $self->id );
}

has rested_turns => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_rested_turns',
);

sub _rested_turns {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'rested_turns', $self->id );
}

has s_str => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_s_str',
);

sub _s_str {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 's_str', $self->id );
}

has s_int => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_s_int',
);

sub _s_int {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 's_int', $self->id );
}

has s_wis => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_s_wis',
);

sub _s_wis {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 's_wis', $self->id );
}

has s_dex => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_s_dex',
);

sub _s_dex {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 's_dex', $self->id );
}

has s_con => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_s_con',
);

sub _s_con {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 's_con', $self->id );
}

has e_str => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_e_str',
);

sub _e_str {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'e_str', $self->id );
}

has e_int => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_e_int',
);

sub _e_int {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'e_int', $self->id );
}

has e_wis => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_e_wis',
);

sub _e_wis {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'e_wis', $self->id );
}

has e_dex => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_e_dex',
);

sub _e_dex {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'e_dex', $self->id );
}

has e_con => (
    is      => 'rw',
    isa     => 'Int',
    lazy    => 1,
    builder => '_e_con',
);

sub _e_con {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'e_con', $self->id );
}

sub strength {
    my $self = shift;
    return $self->s_str + $self->race->strength + $self->class->strength + $self->e_str;
}

sub intelligence {
    my $self = shift;
    return $self->s_int + $self->race->intelligence + $self->class->intelligence + $self->e_int;
}

sub wisdom {
    my $self = shift;
    return $self->s_wis + $self->race->wisdom + $self->class->wisdom + $self->e_wis;
}

sub dexterity {
    my $self = shift;
    return $self->s_dex + $self->race->dexterity + $self->class->dexterity + $self->e_dex;
}

sub constitution {
    my $self = shift;
    return $self->s_con + $self->race->constitution + $self->class->constitution + $self->e_con;
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
