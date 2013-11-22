package CentralWidget;

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

    my $sex = Qt::ComboBox();
    this->{sexComboBox} = $sex;
    $sex->addItem( this->tr('Female') );
    $sex->addItem( this->tr('Male') );
    $sex->addItem( this->tr('Neuter') );

    my $layout = Qt::GridLayout();
    $layout->addWidget( this->{sexComboBox}, 0, 0 );

    this->setLayout( $layout );
}

1;
