package CentralWidget;

use strict;
use warnings;

use 5.010;
use Data::Dumper;

use QtCore4;
use QtGui4;
use QtCore4::isa qw( Qt::Widget );

use QtCore4::slots
    sexChanged  => [],
    raceChanged => [];

use lib 'lib';
use Rogalik::DB;

sub sexChanged {
#    say this->{sexComboBox}->currentText();

    if( this->{sexComboBox}->currentIndex() ) {
        this->{raceComboBox}->setEnabled( 1 );
    }
    else {
        this->{raceComboBox}->setDisabled( 1 );
    }
}

sub raceChanged {
    if( my $raceIndex = this->{raceComboBox}->currentIndex() ) {
        this->{charFactorsGroupBox}->setEnabled( 1 );

        # update and show basic factors
        foreach my $factor( qw( str dex int con wis chr ) ) {
            this->{$factor}->setText( this->tr( this->getFactor( $factor, $raceIndex ) ) );
        }

        # update and show rest
        my $data = '';

        ## hit/shoot/throw
        foreach my $factor( qw( hit shoot throw ) ) {
            $data .= this->getFactor( $factor, $raceIndex ) . '/';
        }
        $data =~ s|/$||;
        this->{hitShootThrow}->setText( this->tr( $data ) );

        this->{hitDie}->setText( this->tr( this->getFactor( 'hitDie', $raceIndex ) ) );
        this->{XPmod}->setText( this->tr( this->getFactor( 'XPmod', $raceIndex ) . '%' ) );
    }
    else {
        # do not show data if nothing choosen
        foreach my $factor( qw ( str dex int con wis chr hitShootThrow hitDie XPmod ) ) {
            this->{$factor}->setText( this->tr( '' ) );
        }

        this->{charFactorsGroupBox}->setDisabled( 1 );
    }
}

sub NEW {
    my ( $class ) = @_;
    $class->SUPER::NEW();

    this->{sexComboBox} = this->createSexCombo();
    this->{raceComboBox} = this->createRaceCombo();

    this->connect(
        this->{sexComboBox},
        SIGNAL 'currentIndexChanged(int)',
        this,
        SLOT 'sexChanged()',
    );
    this->connect(
        this->{raceComboBox},
        SIGNAL 'currentIndexChanged(int)',
        this,
        SLOT 'raceChanged()',
    );

    my $groupBox = Qt::GroupBox( this->tr( 'Race factors and bonuses' ) );
    
    my $charFactors = Qt::GridLayout();
    this->{charFactorsLayout} = $charFactors;

    # create basic character factors table
    this->{charBasicFactorsLayout} = this->createBasicFactors();

    # show basic character factors
    $charFactors->addLayout( this->{charBasicFactorsLayout}, 0, 0 );

    # placeholder between basic and additional character factors
    $charFactors->setRowMinimumHeight( 1, 20 );

    # create additional character factors table
    this->{charAddFactorsLayout} = this->createAdditionalFactors();

    # show additional character factors
    $charFactors->addLayout( this->{charAddFactorsLayout}, 2, 0 );

    # placeholder between additional character factors and bonuses
    $charFactors->setRowMinimumHeight( 3, 20 );

    # create bonuses
    this->{raceBonus} = Qt::Label( this->tr( '' ) );
    # show bonuses
    $charFactors->addWidget( this->{raceBonus}, 4, 0 );

    $groupBox->setLayout( this->{charFactorsLayout} );
    this->{charFactorsGroupBox} = $groupBox;

    # initial hide character factors
    $groupBox->setDisabled( 1 );

    # main layout
    my $layout = Qt::GridLayout( this );

    # left placeholder
    $layout->setColumnMinimumWidth( 0, 20 );

    # show character create invitation
    $layout->addWidget(
        Qt::Label( this->tr( 'Plese select your character from the menu below:' ) ),
        0, 1,
        1, 3,
        Qt::AlignHCenter() | Qt::AlignBottom(),
    );

    # show menus
    $layout->addWidget( this->{sexComboBox}, 1, 1, Qt::AlignTop() );
    $layout->addWidget( this->{raceComboBox}, 2, 1, Qt::AlignTop() );

    # placeholder between menus and tables
    $layout->setColumnMinimumWidth( 2, 20 );

    # show character factors and bonuses table
    $layout->addWidget( this->{charFactorsGroupBox}, 2, 3 );
}

sub createSexCombo {
    my $sex = Qt::ComboBox();

    $sex->addItem( this->tr('Choose sex...') );
    $sex->addItem( this->tr('Female') );
    $sex->addItem( this->tr('Male') );
    $sex->addItem( this->tr('Neuter') );

    $sex->setToolTip( this->tr("Your 'sex' does not have any significant gameplay effects") );

    return $sex;
}

sub createRaceCombo {
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

    $race->setDisabled( 1 );

    return $race;
}

sub createBasicFactors {
    my $basicFactors = Qt::GridLayout();

    my ( $row, $column, $count ) = ( 0, 0, 0 );

    foreach my $charFactor( qw( str dex int con wis chr ) ) {
        # Strength Dexterity Intelligence Constitution Wisdom Charisma
        my $labelTxt       = ucfirst $charFactor;

        this->{$charFactor}  = Qt::Label( this->tr( '' ) );

        $basicFactors->addWidget( Qt::Label( this->tr( "$labelTxt:" ) ), $row, $column );
        $basicFactors->addWidget( this->{$charFactor}, $row, $column + 1, Qt::AlignRight() );

        $count++;
        $row++ unless $count % 2;
        $column += 2;
        $column = 0 unless $count % 2;
    }

    return $basicFactors;
}

sub createAdditionalFactors {
    my $addFactors = Qt::GridLayout();

    $addFactors->addWidget(
        Qt::Label( this->tr( 'Hit/Shoot/Throw:' ) ),
        0, 0,  # row,      column
        1, 2,  # row span, column span
    );

    this->{hitShootThrow} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{hitShootThrow},
        0, 2,
        1, 2,
    );

    $addFactors->addWidget( Qt::Label( this->tr( 'Hit die:' ) ), 1, 0 );
    this->{hitDie} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{hitDie},
        1, 1,
    );

    $addFactors->addWidget( Qt::Label( this->tr( 'XP mod:' ) ), 1, 2 );
    this->{XPmod} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{XPmod},
        1, 3,
    );

    $addFactors->addWidget( Qt::Label( this->tr( 'Disarm:' ) ), 2, 0 );
    this->{disarm} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{disarm},
        2, 1,
    );

    $addFactors->addWidget( Qt::Label( this->tr( 'Devices:' ) ), 2, 2 );
    this->{devices} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{devices},
        2, 3,
    );

    $addFactors->addWidget( Qt::Label( this->tr( 'Save:' ) ), 3, 0 );
    this->{save} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{save},
        3, 1,
    );

    $addFactors->addWidget( Qt::Label( this->tr( 'Stealth:' ) ), 3, 2 );
    this->{stealth} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{stealth},
        3, 3,
    );

    $addFactors->addWidget(
        Qt::Label( this->tr( 'Infravision:' ) ),
        4, 0,
        1, 2,
    );
    this->{infravision} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{infravision},
        4, 2,
        1, 2,
    );

    $addFactors->addWidget(
        Qt::Label( this->tr( 'Digging:' ) ),
        5, 0,
        1, 2,
    );
    this->{digging} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{digging},
        5, 2,
        1, 2,
    );

    $addFactors->addWidget(
        Qt::Label( this->tr( 'Search:' ) ),
        6, 0,
        1, 2,
    );
    this->{search} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{search},
        6, 2,
        1, 2,
    );

    return $addFactors;
}

sub getFactor {
    my $factor    = shift;
    my $raceIndex = shift;

    my ( $result, $rows, $rv ) = Rogalik::DB->execute(
        "select $factor from race where guiId = $raceIndex"
    );

#    say 'getFactor, $rows: '.$rows;
#    say "getFactor, \$rv: $rv";

    return $result->[0]->{$factor};
}

1;
