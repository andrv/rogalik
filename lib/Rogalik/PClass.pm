package Rogalik::PClass;
#===============================================================================
#
#         FILE:  PClass.pm
#
#  DESCRIPTION:  game class data
#
#===============================================================================

use strict;
use warnings;

use 5.010;
use Moose;

use Data::Dumper;
use Rogalik::DB;

has id => (
    is       => 'ro',
    isa      => 'Int',
    required => 1,
);

has name => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    builder => '_name',
);

sub _name {
    my $self = shift;
    return Rogalik::DB->get( 'theClass', 'name', $self->id );
}

has magicless => (
    is      => 'ro',
    isa     => 'Bool',
    lazy    => 1,
    builder => '_magicless',
);

sub _magicless {
    my $self = shift;
    return ( Rogalik::DB->get( 'theClass', 'first_spell_lvl', $self->id ) ? 0 : 1 );
}

has hp => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_hp',
);

sub _hp {
    my $self = shift;
    return Rogalik::DB->get( 'theClass', 'hp', $self->id );
}

has first_spell_lvl => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_first_spell_lvl',
);

sub _first_spell_lvl {
    my $self = shift;
    return Rogalik::DB->get( 'theClass', 'first_spell_lvl', $self->id );
}

has strength => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_strength',
);

sub _strength {
    my $self = shift;
    return Rogalik::DB->get( 'theClass', 'strength', $self->id );
}

has intelligence => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_intelligence',
);

sub _intelligence {
    my $self = shift;
    return Rogalik::DB->get( 'theClass', 'intelligence', $self->id );
}

has wisdom => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_wisdom',
);

sub _wisdom {
    my $self = shift;
    return Rogalik::DB->get( 'theClass', 'wisdom', $self->id );
}

has dexterity => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_dexterity',
);

sub _dexterity {
    my $self = shift;
    return Rogalik::DB->get( 'theClass', 'dexterity', $self->id );
}

has constitution => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_constitution',
);

sub _constitution {
    my $self = shift;
    return Rogalik::DB->get( 'theClass', 'constitution', $self->id );
}

no Moose;
__PACKAGE__->meta->make_immutable;
