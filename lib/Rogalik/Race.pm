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

has hp => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_hp',
);

sub _hp {
    my $self = shift;
    return Rogalik::DB->get( 'theRace', 'hp', $self->id );
}

has age => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_age',
);

sub _age {
    my $self = shift;
    return Rogalik::DB->get( 'theRace', 'age', $self->id );
}

has age_mod => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_age_mod',
);

sub _age_mod {
    my $self = shift;
    return Rogalik::DB->get( 'theRace', 'age_mod', $self->id );
}

has height_male => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_height_male',
);

sub _height_male {
    my $self = shift;
    return Rogalik::DB->get( 'theRace', 'height_male', $self->id );
}

has height_male_mod => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_height_male_mod',
);

sub _height_male_mod {
    my $self = shift;
    return Rogalik::DB->get( 'theRace', 'height_male_mod', $self->id );
}

has height_female => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_height_female',
);

sub _height_female {
    my $self = shift;
    return Rogalik::DB->get( 'theRace', 'height_female', $self->id );
}

has height_female_mod => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_height_female_mod',
);

sub _height_female_mod {
    my $self = shift;
    return Rogalik::DB->get( 'theRace', 'height_female_mod', $self->id );
}

has weight_male => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_weight_male',
);

sub _weight_male {
    my $self = shift;
    return Rogalik::DB->get( 'theRace', 'weight_male', $self->id );
}

has weight_male_mod => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_weight_male_mod',
);

sub _weight_male_mod {
    my $self = shift;
    return Rogalik::DB->get( 'theRace', 'weight_male_mod', $self->id );
}

has weight_female => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_weight_female',
);

sub _weight_female {
    my $self = shift;
    return Rogalik::DB->get( 'theRace', 'weight_female', $self->id );
}

has weight_female_mod => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_weight_female_mod',
);

sub _weight_female_mod {
    my $self = shift;
    return Rogalik::DB->get( 'theRace', 'weight_female_mod', $self->id );
}

no Moose;
__PACKAGE__->meta->make_immutable;
