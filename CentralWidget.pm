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

    $sex->addItem( this->tr('Choose sex...') );
    $sex->addItem( this->tr('Female') );
    $sex->addItem( this->tr('Male') );
    $sex->addItem( this->tr('Neuter') );

    $sex->setToolTip( this->tr("Your 'sex' does not have any significant gameplay effects") );

    my $race = Qt::ComboBox();
    this->{raceComboBox} = $race;

    $race->addItem( this->tr('Choose race...') );
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

    my $charFactors = Qt::GridLayout();
    this->{charFactorsLayout} = $charFactors;

    my $charBasicFactors = Qt::GridLayout();
    this->{charBasicFactorsLayout} = $charBasicFactors;

    my $strengthLabel = Qt::Label( this->tr('Str:') );
    this->{strengthLabel} = $strengthLabel;

    my $strengthData = Qt::Label( this->tr('data') );
    this->{strengthDataLabel} = $strengthData;

    my $dexterityLabel = Qt::Label( this->tr('Dex:') );
    this->{dexterityLabel} = $dexterityLabel;

    my $dexterityData = Qt::Label( this->tr('data') );
    this->{dexterityDataLabel} = $dexterityData;

    my $intelligenceLabel = Qt::Label( this->tr('Int:') );
    this->{intelligenceLabel} = $intelligenceLabel;

    my $intelligenceData = Qt::Label( this->tr('data') );
    this->{intelligenceDataLabel} = $intelligenceData;

    $charBasicFactors->addWidget( this->{strengthLabel}, 0, 0 );
    $charBasicFactors->addWidget( this->{strengthDataLabel}, 0, 1 );
    $charBasicFactors->addWidget( this->{dexterityLabel}, 0, 2 );
    $charBasicFactors->addWidget( this->{dexterityDataLabel}, 0, 3 );
    $charBasicFactors->addWidget( this->{intelligenceLabel}, 1, 0 );
    $charBasicFactors->addWidget( this->{intelligenceDataLabel}, 1, 1 );

    $charFactors->addLayout( this->{charBasicFactorsLayout}, 0, 0 );

    my $layout = Qt::GridLayout();
    $layout->addWidget( this->{sexComboBox}, 0, 0 );
    $layout->addWidget( this->{raceComboBox}, 1, 0 );

    $layout->addLayout( this->{charFactorsLayout}, 1, 1 );

    this->setLayout( $layout );
}

1;
