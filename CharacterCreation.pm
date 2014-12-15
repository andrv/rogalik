package CharacterCreation;

use strict;
use warnings;

use 5.010;
use Data::Dumper;

use QtCore4;
use QtGui4;
use QtCore4::isa qw( Qt::Widget );

use QtCore4::slots
    sexChanged   => [],
    raceChanged  => [],
    classChanged => [];

use lib 'lib';
use Rogalik::DB;

# constructor
sub NEW {
    my ( $class ) = @_;
    $class->SUPER::NEW();

    this->{sexComboBox}   = this->createCombo( 'sex', qw/ Female Male Neuter / );
    this->{raceComboBox}  = this->createCombo( 'race' );
    this->{classComboBox} = this->createCombo( 'class' );

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
    this->connect(
        this->class(),
        SIGNAL 'currentIndexChanged(int)',
        this,
        SLOT 'classChanged()',
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
    this->prepareBonusArea();

    $groupBox->setLayout( this->{charFactorsLayout} );
    this->{charFactorsGroupBox} = $groupBox;

    # initial hide character factors
    $groupBox->setDisabled( 1 );

    # main layout
    my $layout = Qt::GridLayout( this );

    # space left
    $layout->setColumnMinimumWidth( 0, 20 );

    # show character create invitation
    $layout->addWidget(
        Qt::Label( this->tr( 'Please select your character from the menus below.'.
                "\n".
                'Hit enter to select the current menu item:'
        ) ),
        0, 1,
        1, 3,
        Qt::AlignHCenter() | Qt::AlignBottom(),
    );

    # show menus
    $layout->addWidget( this->sex(), 1, 1, Qt::AlignTop() );
    $layout->addWidget( this->race(), 2, 1, Qt::AlignTop() );
    $layout->addWidget( this->class(), 3, 1, Qt::AlignTop() );

    # space between menus and tables
    $layout->setColumnMinimumWidth( 2, 20 );

    # show character factors and bonuses table
    $layout->addWidget( this->characterFactors(), 3, 3 );

    # space between character factors table and right window edge
    $layout->setColumnMinimumWidth( 4, 20 );

    # a bit space at bottom
    $layout->setRowMinimumHeight( 4, 20 );

    this->setWindowTitle( 'Character creation' );
}

# slots
sub sexChanged {
    unless( this->sex()->currentIndex() )  {
        # do not show character data if no sex choosen
        foreach my $factor( qw ( Strength Dexterity Intelligence Constitution Wisdom hitShootThrow HitDie XPmod Disarm Devices Save Stealth Infravision Digging Search bonusLine1 ) ) {
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
    this->class()->setCurrentIndex( 0 );
    this->class()->setDisabled( 1 );

    if( this->race()->currentIndex() ) {
        this->changeStats( race => this->race()->currentText() );
        this->characterFactors()->setEnabled( 1 );

        # update and show flags
        this->showFlags( race => this->race()->currentText() );
    }
    else {
        # do not show data if nothing choosen
        foreach my $stat( qw ( Strength Dexterity Intelligence Constitution Wisdom hitShootThrow HitDie XPmod Disarm Devices Save Stealth Infravision Digging Search ) ) {
            this->{$stat}->setText( this->tr( '' ) );
        }

        this->characterFactors()->setDisabled( 1 );
        this->race()->setDisabled(1);
        this->sexChanged();
        this->sex()->setFocus();
    }
}

sub classChanged {
    if( this->class()->currentIndex() ) {
        this->changeStats(
            class => this->class()->currentText(),
            race  => this->race()->currentText(),
        );

        # update and show flags
        this->showFlags( class => this->class()->currentText() );
    }
    else {
        # show race factors
        this->raceChanged();
        this->race()->setFocus();
    }
}

# methods

sub createCombo {
    my( $type, @data ) = @_;
    my %toolTip = (
        sex   => "Your 'sex' does not have any significant gameplay effects",
        race  => "Your 'race' determines various intrinsic factors and bonuses",
        class => "Your 'class' determines various intrinsic factors and bonuses",
    );

    my $combo = Qt::ComboBox();
    $combo->addItem( this->tr( "Choose $type..." ) );
    $combo->setToolTip( this->tr( $toolTip{$type} ) );

    unless( @data ) {
        # get data from db
        my( $res, $rows, $rv ) = Rogalik::DB->execute( "select name from the@{[ucfirst $type]} order by id asc" );

        foreach my $line( @$res ) {
            push @data, $line->{name}
        }
    }

    foreach my $element( @data ) {
        $combo->addItem( this->tr( $element ) );
    }

    $combo->setDisabled( 1 ) unless $type eq 'sex';

    return $combo;
}

sub createBasicFactors {
    my $basicFactors = Qt::GridLayout();

    my ( $row, $column, $count ) = ( 0, 0, 0 );

    foreach my $charFactor( qw( Strength Dexterity Intelligence Constitution Wisdom ) ) {
        this->{$charFactor}  = Qt::Label( this->tr( '' ) );

        $basicFactors->addWidget( Qt::Label( this->tr( "$charFactor:" ) ), $row, $column );
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

sub prepareBonusArea {
    this->{"bonusLine1"} = Qt::Label( this->tr( '' ) );
    this->{charFactorsLayout}->addWidget( this->{"bonusLine1"}, 4, 0, Qt::AlignTop() );
    this->{charFactorsLayout}->setRowMinimumHeight( 4, 51 );
}

sub changeStats {
    my %args = @_;
    my @fields = qw/ strength dexterity intelligence constitution wisdom disarming magic_device saving_throw stealth search_ability search_freq to_hit_melee to_hit_bow to_hit_throw digging hp exp infravision /;

    my( $res, $rows, $rv ) = Rogalik::DB->execute( "select @{[ join ', ', @fields ]} from theRace where name = '$args{race}'" );
    my %dbdata = %{$res->[0]};

    if( exists $args{class} ) {
        pop @fields;
        my( $res, $rows, $rv ) = Rogalik::DB->execute( "select @{[ join ', ', @fields ]} from theClass where name = '$args{class}'" );

        # calculate race + class stats
        foreach my $field( keys %{$res->[0]} ) {
            $dbdata{$field} += $res->[0]->{$field};
        }
    }

    my %ret = ();
    my %db2gui = (
        to_hit_melee => 'Hit',
        to_hit_bow   => 'Shoot',
        to_hit_throw => 'Throw',
        hp           => 'HitDie',
        disarming    => 'Disarm',
        magic_device => 'Devices',
        saving_throw => 'Save',
    );

    foreach my $key( qw/ Strength Dexterity Intelligence Constitution Wisdom Stealth Digging / ) {
        $ret{$key} = $dbdata{lc $key};
    }

    foreach my $key( keys %db2gui ) {
        $ret{$db2gui{$key}} = $dbdata{$key};
    }

    $ret{XPmod}       = "$dbdata{exp}%";
    $ret{Infravision} = ($dbdata{infravision} * 10) ." ft";

    # search
    $dbdata{search_ability} = this->addSign( $dbdata{search_ability} );
    $ret{Search} = "$dbdata{search_ability}/$dbdata{search_freq}";

    while( my( $key, $value ) = each %ret ) {
        unless( grep( m/^$key$/, qw / HitDie XPmod Infravision Search / ) ) {
            $ret{$key} = this->addSign( $value );
        }
    }

    # update and show basic factors
    foreach my $stat( qw( Strength Dexterity Intelligence Constitution Wisdom ) ) {
        this->{$stat}->setText( this->tr( $ret{$stat} ) );
    }

    # update and show Hit/Shoot/Throw
    this->showHitShootThrow(%ret);

    # update and show rest
    foreach my $stat( qw( HitDie XPmod Disarm Devices Save Stealth Infravision Digging Search ) ) {
        this->{$stat}->setText( this->tr( $ret{$stat} ) );
    }
}

sub addSign {
    my $number = shift;
    return sprintf '%+d', $number if $number >= 0;
    return sprintf '%-d', $number if $number <  0;
}

sub showFlags {
    my( $which, $name ) = @_;

    my $table   = "the". ucfirst( $which );
    my $toFlag  = "${which}2flag";
    my $toColmn = "${which}_id";

    my @flags;

    my( $res, $rows, $rv ) = Rogalik::DB->execute( "select Flags.id, Flags.abbr, Flags.desc from Flags, $toFlag, $table where Flags.hidden is null and Flags.id = $toFlag.flag_id and $toFlag.$toColmn = $table.id and $table.name = '$name' order by Flags.id" );
    
    foreach my $flag( @$res ) {
        push @flags, $flag->{desc};
    }

    this->{"bonusLine1"}->setText( this->tr( '' ) );
    this->{"bonusLine1"}->setText( this->tr( join "\n", @flags ) );
}

sub showHitShootThrow {
    my %factors = @_;
    return unless %factors;

    this->{hitShootThrow}->setText(this->tr(join '/', @factors{qw(Hit Shoot Throw)}));
}

# getters
sub sex { return this->{sexComboBox} }

sub race { return this->{raceComboBox} }

sub class { return this->{classComboBox} }

sub characterFactors { return this->{charFactorsGroupBox} }

1;
