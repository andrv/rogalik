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

    this->{sexComboBox} = this->sexCombo();
    this->{raceComboBox} = this->raceCombo();

    my $charFactors = Qt::GridLayout();
    this->{charFactorsLayout} = $charFactors;

    # create basic character factors table
    this->{charBasicFactorsLayout} = this->createBasicFactors();

    $charFactors->addLayout( this->{charBasicFactorsLayout}, 0, 0 );

    # placeholder between basic and additional character factors
    $charFactors->setRowMinimumHeight( 1, 20 );

    # create additional character factors table

    # main layout
    my $layout = Qt::GridLayout();

    # left placeholder
    $layout->setColumnMinimumWidth( 0, 20 );

    # show menus
    $layout->addWidget( this->{sexComboBox}, 0, 1 );
    $layout->addWidget( this->{raceComboBox}, 1, 1 );

    # placeholder between menus and tables
    $layout->setColumnMinimumWidth( 2, 20 );

    # show character factors and bonuses table
    $layout->addLayout( this->{charFactorsLayout}, 1, 3 );

    this->setLayout( $layout );
}

sub sexCombo {
    my $sex = Qt::ComboBox();

    $sex->addItem( this->tr('Choose sex...') );
    $sex->addItem( this->tr('Female') );
    $sex->addItem( this->tr('Male') );
    $sex->addItem( this->tr('Neuter') );

    $sex->setToolTip( this->tr("Your 'sex' does not have any significant gameplay effects") );

    return $sex;
}

sub raceCombo {
    my $race = Qt::ComboBox();

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

    return $race;
}

sub createBasicFactors {
    my $basicFactors = Qt::GridLayout();

    my ( $row, $column, $count ) = ( 0, 0, 0 );

    foreach my $charFactor( qw( str dex int con wis chr ) ) {
        # Strength Dexterity Intelligence Constitution Wisdom Charisma
        my $childnameLabel = $charFactor.'Label';
        my $childnameData  = $charFactor.'Data';
        my $labelTxt       = ucfirst $charFactor;

        this->{$childnameLabel} = Qt::Label( this->tr( "$labelTxt:" ) );
        this->{$childnameData}  = Qt::Label( this->tr( 'data' ) );

        $basicFactors->addWidget(
            this->{$childnameLabel},
            $row,
            $column,
        );
        $basicFactors->addWidget(
            this->{$childnameData},
            $row,
            $column + 1,
        );

        $count++;
        $row++ unless $count % 2;
        $column += 2;
        $column = 0 unless $count % 2;
    }

    return $basicFactors;
}

1;
