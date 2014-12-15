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

no Moose;
__PACKAGE__->meta->make_immutable;
