package Rogalik::Basics;
#===============================================================================
#
#         FILE:  Basics.pm
#
#  DESCRIPTION:  Game basics
#
#===============================================================================

use strict;
use warnings;

use 5.010;
use Moose;

use Data::Dumper;
use Rogalik::DB;

has playerMaxLevel => (
    is      => 'ro',
    isa     => 'Int',
    lazy    => 1,
    builder => '_player_max_lvl',
);

sub _player_max_lvl {
    my( $res, $rows, $rv ) = Rogalik::DB->execute( "select value from gameBasics where name = 'PlayerMaxLevel'" );
    return $res->[0]->{value};
}

no Moose;
__PACKAGE__->meta->make_immutable;
