package Rogalik::Tools;
#===============================================================================
#
#         FILE:  Tools.pm
#
#  DESCRIPTION:  
#
#===============================================================================

use strict;
use warnings;

use 5.010;
use Data::Dumper;

sub randint0 {
    my $self = ref $_[0] ? ref shift : shift;
    my $max = shift;
    return int( rand( $max ) );
}

sub randint1 {
    my $self = ref $_[0] ? ref shift : shift;
    my $max = shift;
    return ( int( rand( $max ) ) + 1 );
}

1;
