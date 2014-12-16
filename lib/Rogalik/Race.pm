package Rogalik::Race;
#===============================================================================
#
#         FILE:  Race.pm
#
#  DESCRIPTION:  race data read only
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
    return Rogalik::DB->get( 'theRace', 'name', $self->id );
}

has age => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    builder => '_age',
);

sub _age {
    my $self = shift;
    return Rogalik::DB->get( 'theRace', 'age', $self->id );
}

has age_mod => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    builder => '_age_mod',
);

sub _age_mod {
    my $self = shift;
    return Rogalik::DB->get( 'theRace', 'age_mod', $self->id );
}

no Moose;
__PACKAGE__->meta->make_immutable;
