package MainWindow;

use strict;
use warnings;

use 5.010;
use Data::Dumper;

use QtCore4;
use QtGui4;
use QtCore4::isa qw( Qt::MainWindow );

use CentralWidget;

sub getExitAct() {
    return this->{exitAct};
}

sub NEW {
    my ( $class ) = @_;
    $class->SUPER::NEW();
    my $widget = Qt::Widget();
    this->setCentralWidget( CentralWidget() );

    this->createActions();
    this->createMenus();
}

sub createActions() {
    my $exitAct = this->{exitAct} = Qt::Action( this->tr('E&xit'), this );
    $exitAct->setShortcut(Qt::KeySequence( this->tr('Ctrl+Q') ) );
    $exitAct->setStatusTip( this->tr('Exit the application') );
    this->connect( $exitAct, SIGNAL 'triggered()', this, SLOT 'close()' );
}

sub createMenus {
    my $fileMenu = this->{fileMenu} = this->menuBar()->addMenu( this->tr('&File') );
    $fileMenu->addAction( this->getExitAct() );
}

1;
