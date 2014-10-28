package MainWindow;

use strict;
use warnings;

use 5.010;
use Data::Dumper;

use QtCore4;
use QtGui4;
use QtCore4::isa qw( Qt::MainWindow );

use CharacterCreation;

sub NEW {
    my ( $class ) = @_;
    $class->SUPER::NEW();
    my $widget = Qt::Widget();
    this->setCentralWidget( CharacterCreation() );

    # initial
    this->setGeometry( 100, 100, 800, 600 );

    Qt::Shortcut( Qt::KeySequence( ${Qt::CTRL() + Qt::Key_Q()} ), this, SLOT 'close()' );
}

1;
