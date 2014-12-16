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

has first_spell_lvl => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    builder => '_first_spell_lvl',
);

sub _first_spell_lvl {
    my $self = shift;
    return Rogalik::DB->get( 'theClass', 'first_spell_lvl', $self->id );
}

no Moose;
__PACKAGE__->meta->make_immutable;
