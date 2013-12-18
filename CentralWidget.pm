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
    raceChanged => [],
    nextStep    => [];

use lib 'lib';
use Rogalik::DB;

# constructor
sub NEW {
    my ( $class ) = @_;
    $class->SUPER::NEW();

    this->{sexComboBox}   = this->createSexCombo();
    this->{raceComboBox}  = this->createRaceCombo();
    this->{classComboBox} = this->createClassCombo();

    this->connect(
        this->sex(),
        SIGNAL 'currentIndexChanged(int)',
        this,
        SLOT 'sexChanged()',
    );
    this->connect(
        this->race(),
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
    this->{bonusLine1} = Qt::Label( this->tr( '' ) );
    $charFactors->addWidget( this->{bonusLine1}, 4, 0 );
    $charFactors->setRowMinimumHeight( 4, 17 );
    this->{bonusLine2} = Qt::Label( this->tr( '' ) );
    $charFactors->addWidget( this->{bonusLine2}, 5, 0 );
    $charFactors->setRowMinimumHeight( 5, 17 );

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
        Qt::Label( this->tr( 'Plese select your character from the menus below:' ) ),
        0, 1,
        1, 3,
        Qt::AlignHCenter() | Qt::AlignBottom(),
    );

    # show menus
    $layout->addWidget( this->sex(), 1, 1, Qt::AlignTop() );
    $layout->addWidget( this->race(), 2, 1, Qt::AlignTop() );
    $layout->addWidget( this->class(), 3, 1, Qt::AlignTop() );

    # placeholder between menus and tables
    $layout->setColumnMinimumWidth( 2, 20 );

    # show character factors and bonuses table
    $layout->addWidget( this->characterFactors(), 3, 3 );

    Qt::Shortcut( Qt::KeySequence( ${Qt::Key_Enter()} ), this, SLOT 'nextStep()' );
    Qt::Shortcut( Qt::KeySequence( ${Qt::Key_Return()} ), this, SLOT 'nextStep()' );
}

# slots
sub sexChanged {
#    say this->sex()->currentText();

    if( this->sex()->currentIndex() ) {
        this->race()->setEnabled( 1 );
    }
    else {
        # do not show character data if no sex choosen
        foreach my $factor( qw ( Strength Dexterity Intelligence Constitution Wisdom Charisma hitShootThrow HitDie XPmod Disarm Devices Save Stealth Infravision Digging Search bonusLine1 bonusLine2 ) ) {
            this->{$factor}->setText( this->tr( '' ) );
        }

        this->characterFactors()->setDisabled( 1 );

        this->race()->setCurrentIndex( 0 );
        this->race()->setDisabled( 1 );

        this->class()->setCurrentIndex( 0 );
        this->class()->setDisabled( 1 );
    }
}

sub raceChanged {
    # clear bonuses
    foreach my $factor( qw ( bonusLine1 bonusLine2 ) ) {
        this->{$factor}->setText( this->tr( '' ) );
    }

    if( this->race()->currentIndex() ) {
        my %factors = this->getFactors( this->race()->currentText() );
        this->characterFactors()->setEnabled( 1 );

        # update and show basic factors
        foreach my $factor( qw( Strength Dexterity Intelligence Constitution Wisdom Charisma ) ) {
            this->{$factor}->setText( this->tr( delete $factors{$factor} ) );
        }

        # update and show rest
        my $data = '';

        foreach my $factor( qw( Hit Shoot Throw ) ) {
            $data .= delete( $factors{$factor} ) . '/';
        }
        $data =~ s|/$||;
        this->{hitShootThrow}->setText( this->tr( $data ) );

        foreach my $factor( qw( HitDie XPmod Disarm Devices Save Stealth Infravision Digging Search ) ) {
            this->{$factor}->setText( this->tr( delete $factors{$factor} ) );
        }

        this->showBonuses( %factors );
    }
    else {
        # do not show data if nothing choosen
        foreach my $factor( qw ( Strength Dexterity Intelligence Constitution Wisdom Charisma hitShootThrow HitDie XPmod Disarm Devices Save Stealth Infravision Digging Search ) ) {
            this->{$factor}->setText( this->tr( '' ) );
        }

        this->characterFactors()->setDisabled( 1 );

        this->class()->setCurrentIndex( 0 );
        this->class()->setDisabled( 1 );
    }
}

sub nextStep {
    this->class()->setEnabled( 1 ) if this->race()->currentIndex();
    this->class()->setFocus();
}

# methods
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

    $race->addItem( this->tr('Choose race... hit enter if done') );
    $race->addItem( this->tr('Human') );
    $race->addItem( this->tr('Half-Elf') );
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

sub createClassCombo {
    my $class = Qt::ComboBox();

    $class->addItem( this->tr('Choose class...') );
    $class->addItem( this->tr('Warrior') );
    $class->addItem( this->tr('Mage') );
    $class->addItem( this->tr('Priest') );
    $class->addItem( this->tr('Rogue') );
    $class->addItem( this->tr('Ranger') );
    $class->addItem( this->tr('Paladin') );

    $class->setToolTip( this->tr("Your 'class' determines various intrinsic factors and bonuses") );

    $class->setDisabled( 1 );

    return $class;
}

sub createBasicFactors {
    my $basicFactors = Qt::GridLayout();

    my ( $row, $column, $count ) = ( 0, 0, 0 );

    foreach my $charFactor( qw( Strength Dexterity Intelligence Constitution Wisdom Charisma ) ) {
        # TODO exterminate next line
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
    this->{HitDie} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{HitDie},
        1, 1, Qt::AlignRight(),
    );

    $addFactors->addWidget( Qt::Label( this->tr( 'XP mod:' ) ), 1, 2 );
    this->{XPmod} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{XPmod},
        1, 3, Qt::AlignRight(),
    );

    $addFactors->addWidget( Qt::Label( this->tr( 'Disarm:' ) ), 2, 0 );
    this->{Disarm} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{Disarm},
        2, 1, Qt::AlignRight(),
    );

    $addFactors->addWidget( Qt::Label( this->tr( 'Devices:' ) ), 2, 2 );
    this->{Devices} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{Devices},
        2, 3, Qt::AlignRight(),
    );

    $addFactors->addWidget( Qt::Label( this->tr( 'Save:' ) ), 3, 0 );
    this->{Save} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{Save},
        3, 1, Qt::AlignRight(),
    );

    $addFactors->addWidget( Qt::Label( this->tr( 'Stealth:' ) ), 3, 2 );
    this->{Stealth} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{Stealth},
        3, 3, Qt::AlignRight(),
    );

    $addFactors->addWidget(
        Qt::Label( this->tr( 'Infravision:' ) ),
        4, 0,
        1, 2,
    );
    this->{Infravision} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{Infravision},
        4, 2,
        1, 2,
    );

    $addFactors->addWidget(
        Qt::Label( this->tr( 'Digging:' ) ),
        5, 0,
        1, 2,
    );
    this->{Digging} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{Digging},
        5, 2,
        1, 2,
    );

    $addFactors->addWidget(
        Qt::Label( this->tr( 'Search:' ) ),
        6, 0,
        1, 2,
    );
    this->{Search} = Qt::Label( this->tr( '' ) );
    $addFactors->addWidget(
        this->{Search},
        6, 2,
        1, 2,
    );

    return $addFactors;
}

sub getFactors {
    my $race   = shift;

    my ( $result, $rows, $rv ) = Rogalik::DB->execute(
        "select factor, value from charFactors where property = '$race'"
    );

    my %ret = ();

    foreach my $line( @$result ) {
        $ret{$line->{factor}} = $line->{value};
    }

    return %ret;
}

sub showBonuses {
    my %factors = @_;

    if( %factors ) {
        # have bonuses
        if( exists $factors{Sustains} ) {
            this->{bonusLine1}->setText( this->tr( "Sustains $factors{Sustains}" ) );
            delete $factors{Sustains};
        }
        elsif( exists $factors{Resists} ) {
            this->{bonusLine1}->setText( this->tr( "Resists $factors{Resists}" ) );
            delete $factors{Resists};
        }

        if( %factors ) {
            # have more bonuses

            # in %factors should left only one pair
            my( $left, $right ) = %factors;

            my $wichPlace = this->{bonusLine1}->text() ?
                            'bonusLine2'               :
                            'bonusLine1';

            this->{$wichPlace}->setText( this->tr( "$left $right" ) );
        }
    }
}

# getters
sub sex { return this->{sexComboBox} }

sub race { return this->{raceComboBox} }

sub class { return this->{classComboBox} }

sub characterFactors { return this->{charFactorsGroupBox} }

1;
