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

    $sex->setToolTip( this->tr("Your 'sex' does not have any significant gameplay effects") );

    my $race = Qt::ComboBox();
    this->{raceComboBox} = $race;

    $race->addItem( this->tr('Human') );
    $race->addItem( this->tr('Half-elf') );
    $race->addItem( this->tr('Elf') );
    $race->addItem( this->tr('Hobbit') );
    $race->addItem( this->tr('Gnome') );
    $race->addItem( this->tr('Dwarf') );
    $race->addItem( this->tr('Half-Orc') );
    $race->addItem( this->tr('Half-Troll') );
    $race->addItem( this->tr('Dunadan') );
    $race->addItem( this->tr('High-Elf') );
    $race->addItem( this->tr('Kobold') );

    $race->setToolTip( this->tr("Your 'race' determines various intrinsic factors and bonuses") );

    my $strengthLabel = Qt::Label( this->tr('Str:') );
    this->{strengthLabel} = $strengthLabel;

    my $layout = Qt::GridLayout();
    $layout->addWidget( this->{sexComboBox}, 0, 0 );
    $layout->addWidget( this->{raceComboBox}, 1, 0 );
    $layout->addWidget( this->{strengthLabel}, 1, 1 );

    this->setLayout( $layout );
}

1;
