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

    # main layout
    my $layout = Qt::GridLayout( this );

    # left placeholder
    $layout->setColumnMinimumWidth( 0, 20 );

    # invitation for name
    $layout->addWidget(
        Qt::Label( this->tr( 'Enter a name for your character:' ) ),
        0, 1,
#        1, 3,
#        Qt::AlignHCenter() | Qt::AlignBottom(),
    );

}

1;
