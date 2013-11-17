package MainWindow;

use strict;
use warnings;

use 5.010;
use Data::Dumper;

use QtCore4;
use QtGui4;
use QtCore4::isa qw( Qt::MainWindow );

sub NEW {
   shift->SUPER::NEW( @_ );
}

1;
