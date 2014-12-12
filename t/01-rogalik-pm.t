#===============================================================================
#  DESCRIPTION:  tests for class Rogalik
#
#      CREATED:  11.12.2014 14:56:46
#===============================================================================

use strict;
use warnings;


use Test::More;

use FindBin;
use lib "$FindBin::Bin/../lib";

use_ok( 'Rogalik::Character' );
can_ok( 'Rogalik::Character', 'id', 'name', 'sex', 'race', 'class', 'lvl', 'title' );

my $char = Rogalik::Character->new( id => 1 );

done_testing();
