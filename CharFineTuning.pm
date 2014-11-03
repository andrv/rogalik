package CharFineTuning;

use strict;
use warnings;

use 5.010;
use Data::Dumper;

use QtCore4;
use QtGui4;
use QtCore4::isa qw( Qt::Widget );


sub NEW {
    my ( $class ) = @_;
    $class->SUPER::NEW();

    this->setWindowTitle( 'Fine tuning' );
}

1;
