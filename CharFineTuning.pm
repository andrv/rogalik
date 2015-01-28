package CharFineTuning;

use strict;
use warnings;

use 5.010;
use Data::Dumper;

use QtCore4;
use QtGui4;
use QtCore4::isa qw( Qt::Widget );

use QtCore4::slots
    sliderValue => [ 'int' ];

use lib 'lib';
use Rogalik::DB;
use Rogalik::Character;


sub NEW {
    my ( $class, $parent ) = @_;
    $class->SUPER::NEW( $parent );

    this->setWindowTitle( 'Fine tuning' );

    # main layout
    my $layout = Qt::GridLayout( this );

    # left spacer
    $layout->setColumnMinimumWidth( 0, 20 );
    # free space at top
    $layout->setRowMinimumHeight( 0, 20 );
    # don't disappear row with name input field
    $layout->setRowMinimumHeight( 1, 20 );

    # invitation for name input
    this->setNameLabel( Qt::Label( this->tr( 'Enter a name for your character:' ) ) );
    $layout->addWidget(
        this->nameLabel(),
        1, 1,
    );
    
    # name input field
    this->setName( Qt::LineEdit() );
    $layout->addWidget( this->name(), 1, 2, 1, 2 );

    # initiate char object
    this->{character} = Rogalik::Character->new( id => this->parent->currentCharId );

    $layout->addWidget( this->basicsOne(), 2, 1 );

    # spacer
    $layout->setColumnMinimumWidth( 2, 20 );

    $layout->addWidget( this->basicsTwo(), 2, 3 );

    # spacer
    $layout->setColumnMinimumWidth( 4, 20 );

    $layout->addWidget( this->qualities(), 2, 5 );

    # space between top and middle
    $layout->setRowMinimumHeight( 3, 20 );

    $layout->addWidget( this->detailedOne(),   4, 1 );
    $layout->addWidget( this->detailedTwo(),   4, 3 );
    $layout->addWidget( this->detailedThree(), 4, 5 );

    # spacer between middle and bottom
    $layout->setRowMinimumHeight( 5, 20 );

    this->setCharTxtInfo( Qt::Label( this->tr( '(tbd) You are one of several children of a Yeoman. You are the black sheep of the family. You have dark brown eyes, curly blond hair, and a very dark complexion. (tbd) Bla, bla, bla.' ) ) );
    this->charTxtInfo()->setWordWrap( 1 );
    $layout->addWidget( this->charTxtInfo(), 6, 1, 1, 5, Qt::AlignTop() );

    # spacer after bottom
    $layout->setRowMinimumHeight( 7, 20 );

    # spacer at right edge
    $layout->setColumnMinimumWidth( 6, 20 );
}

# slots
sub sliderValue {
    my $action = shift;
#    say "Action: $action";

    my @problematicActions = ( 1, 3, 6, 7 );

    my $sliders = this->findChildren( 'Qt::Slider' );
    my( $statValue, $sliderChanged, $sum, $newValue, $oldValue );

    foreach my $slider( @$sliders ) {
        my $sliderName = $slider->objectName;
        my( $statName ) = $sliderName =~ m/slider(\w+)/;
#        say "Slider '$sliderName', old value: ". $slider->value. ', new value: "'. $slider->sliderPosition. '"';
        $sum += $slider->sliderPosition;

        if( $slider->hasFocus ) {
            $statValue = this->findChildren( 'Qt::Label', "slValue$statName" )->[0];
            $sliderChanged = $slider;
            $oldValue      = $slider->value;
            $newValue      = $slider->sliderPosition;
        }
    }

    if( grep {/$action/} @problematicActions ) {
        say 'Problematic action '. $action. ', sum: '. $sum;
        # check the sum
        if( $sum > 20 ) {
            $sliderChanged->setValue( $oldValue );
            return;
        }
    }

    $sliderChanged->setValue( $newValue );
    $statValue->setNum( $newValue );
}

sub basicsOne {
    my $table = Qt::GridLayout();

    $table->addWidget( Qt::Label( this->tr( 'Name' ) ),             0, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Sex' ) ),              1, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Race' ) ),             2, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Class' ) ),            3, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Title' ) ),            4, 0 );
    $table->addWidget( Qt::Label( this->tr( 'HP' ) ),               5, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Mana' ) ),             6, 0 );

    this->{charName} = Qt::Label( this->tr( this->char->name ) );
    my $hp   = join '/', this->char->chp, this->char->mhp;
    my $mana = join '/', this->char->cmp, this->char->mmp;
    $table->addWidget( this->{charName},                                 0, 1 );
    $table->addWidget( Qt::Label( this->tr( this->char->sex ) ),         1, 1 );
    $table->addWidget( Qt::Label( this->tr( this->char->race->name ) ),  2, 1 );
    $table->addWidget( Qt::Label( this->tr( this->char->class->name ) ), 3, 1 );
    $table->addWidget( Qt::Label( this->tr( this->char->title ) ),       4, 1 );
    $table->addWidget( Qt::Label( this->tr( $hp ) ),                     5, 1 );
    $table->addWidget( Qt::Label( this->tr( $mana ) ),                   6, 1 );

    my $groupBox = Qt::GroupBox();
    $groupBox->setLayout( $table );
    return $groupBox;
}

sub basicsTwo {
    my $table = Qt::GridLayout();

    $table->addWidget( Qt::Label( this->tr( 'Age' ) ),          0, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Height' ) ),       1, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Weight' ) ),       2, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Turns used:' ) ),  3, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Game' ) ),         4, 0, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( 'Standard' ) ),     5, 0, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( 'Resting' ) ),      6, 0, Qt::AlignRight() );

    $table->addWidget( Qt::Label( this->tr( this->char->age ) ), 0, 1 );
    $table->addWidget( Qt::Label( this->tr( this->char->height ." cm" ) ), 1, 1 );
    $table->addWidget( Qt::Label( this->tr( this->char->weight ." kg" ) ), 2, 1 );
    $table->addWidget( Qt::Label( this->tr( this->char->turn ) ), 4, 1, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( this->char->played_turns ) ), 5, 1, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( this->char->rested_turns ) ), 6, 1, Qt::AlignRight() );

    my $groupBox = Qt::GroupBox();
    $groupBox->setLayout( $table );
    return $groupBox;
}

sub qualities {
    my $table = Qt::GridLayout();

    $table->addWidget( Qt::Label( this->tr( 'Strength:' ) ),     1, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Intelligence:' ) ), 2, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Wisdom:' ) ),       3, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Dexterity:' ) ),    4, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Constitution:' ) ), 5, 0 );

    # spacer
    $table->setColumnMinimumWidth( 1, 10 );
    $table->addWidget( Qt::Label( this->tr( 'Self' ) ),        0, 2 );
    $table->addWidget( Qt::Label( this->tr( this->char->s_str ) ), 1, 2 );
    $table->addWidget( Qt::Label( this->tr( this->char->s_int ) ), 2, 2 );
    $table->addWidget( Qt::Label( this->tr( this->char->s_wis ) ), 3, 2 );
    $table->addWidget( Qt::Label( this->tr( this->char->s_dex ) ), 4, 2 );
    $table->addWidget( Qt::Label( this->tr( this->char->s_con ) ), 5, 2 );

    # spacer
    $table->setColumnMinimumWidth( 3, 10 );
    $table->addWidget( Qt::Label( this->tr( 'Race Bonus' ) ), 0, 4 );
    $table->addWidget( Qt::Label( this->tr( this->addSign( this->char->race->strength ) ) ),     1, 4, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( this->addSign( this->char->race->intelligence ) ) ), 2, 4, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( this->addSign( this->char->race->wisdom ) ) ),       3, 4, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( this->addSign( this->char->race->dexterity ) ) ),    4, 4, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( this->addSign( this->char->race->constitution ) ) ), 5, 4, Qt::AlignRight() );

    # spacer
    $table->setColumnMinimumWidth( 5, 10 );
    $table->addWidget( Qt::Label( this->tr( 'Class Bonus' ) ), 0, 6 );
    $table->addWidget( Qt::Label( this->tr( this->addSign( this->char->class->strength ) ) ),     1, 6, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( this->addSign( this->char->class->intelligence ) ) ), 2, 6, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( this->addSign( this->char->class->wisdom ) ) ),       3, 6, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( this->addSign( this->char->class->dexterity ) ) ),    4, 6, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( this->addSign( this->char->class->constitution ) ) ), 5, 6, Qt::AlignRight() );

    # spacer
    $table->setColumnMinimumWidth( 7, 10 );
    my $equiBonusLbl = Qt::Label( this->tr( 'Equi Bonus' ) );
    $equiBonusLbl->setToolTip( this->tr( 'Equipment bonus, potions etc...' ) );
    $table->addWidget( $equiBonusLbl, 0, 8, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( this->addSign( this->char->e_str ) ) ), 1, 8, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( this->addSign( this->char->e_int ) ) ), 2, 8, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( this->addSign( this->char->e_wis ) ) ), 3, 8, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( this->addSign( this->char->e_dex ) ) ), 4, 8, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( this->addSign( this->char->e_con ) ) ), 5, 8, Qt::AlignRight() );

    # spacer
    $table->setColumnMinimumWidth( 9, 10 );
    $table->addWidget( Qt::Label( this->tr( 'Best' ) ),        0, 10 );
    $table->addWidget( Qt::Label( this->tr( this->char->strength ) ), 1, 10 );
    $table->addWidget( Qt::Label( this->tr( this->char->intelligence ) ),2, 10 );
    $table->addWidget( Qt::Label( this->tr( this->char->wisdom ) ), 3, 10 );
    $table->addWidget( Qt::Label( this->tr( this->char->dexterity ) ), 4, 10 );
    $table->addWidget( Qt::Label( this->tr( this->char->constitution ) ), 5, 10 );

    # spacer
    $table->setColumnMinimumWidth( 11, 10 );
    $table->addWidget( Qt::Label( this->tr( 'Cost' ) ), 0, 12 );
    $table->addLayout( this->slider( 'Strength', 8 ), 1, 12 );
    $table->addLayout( this->slider( 'Intelligence', 0 ), 2, 12 );
    $table->addLayout( this->slider( 'Wisdom', 0 ), 3, 12 );
    $table->addLayout( this->slider( 'Dexterity', 12 ), 4, 12 );
    $table->addLayout( this->slider( 'Constitution', 0 ), 5, 12 );

    $table->addWidget( Qt::Label( this->tr( 'Total Cost:' ) ), 6, 6, 1, 5, Qt::AlignRight() );
    $table->addWidget( Qt::Label( this->tr( '20/20 (tbd)' ) ), 6, 12 );

    my $groupBox = Qt::GroupBox();
    $groupBox->setLayout( $table );
    return $groupBox;
}

sub detailedOne {
    my $table = Qt::GridLayout();

    $table->addWidget( Qt::Label( this->tr( 'Level' ) ),         0, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Cur Exp' ) ),       1, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Max Exp' ) ),       2, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Adv Exp' ) ),       3, 0 );
    $table->addWidget( Qt::Label( this->tr( '' ) ),              4, 0 ); # spacer
    $table->addWidget( Qt::Label( this->tr( 'Gold' ) ),          5, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Burden' ) ),        6, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Speed' ) ),         7, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Max Depth' ) ),     8, 0 );

    $table->addWidget( Qt::Label( this->tr( this->char->lvl ) ), 0, 1 );
    $table->addWidget( Qt::Label( this->tr( '0 (tbd)' ) ),       1, 1 );
    $table->addWidget( Qt::Label( this->tr( '0 (tbd)' ) ),       2, 1 );
    $table->addWidget( Qt::Label( this->tr( '10 (tbd)' ) ),      3, 1 );
    # spacer
    $table->addWidget( Qt::Label( this->tr( '600 (tbd)' ) ),     5, 1 );
    $table->addWidget( Qt::Label( this->tr( '0.0 lbs (tbd)' ) ), 6, 1 );
    $table->addWidget( Qt::Label( this->tr( 'Normal (tbd)' ) ),  7, 1 );
    $table->addWidget( Qt::Label( this->tr( 'Town (tbd)' ) ),    8, 1 );

    my $groupBox = Qt::GroupBox();
    $groupBox->setLayout( $table );
    return $groupBox;
}

sub detailedTwo {
    my $table = Qt::GridLayout();

    $table->addWidget( Qt::Label( this->tr( 'Armor' ) ),        0, 0 );
    $table->addWidget( Qt::Label( this->tr( '' ) ),             1, 0 ); # spacer
    $table->addWidget( Qt::Label( this->tr( 'Melee' ) ),        2, 0 );
    $table->addWidget( Qt::Label( this->tr( 'To-hit' ) ),       3, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Blows' ) ),        4, 0 );
    $table->addWidget( Qt::Label( this->tr( '' ) ),             5, 0 ); # spaser
    $table->addWidget( Qt::Label( this->tr( 'Shoot to-dam' ) ), 6, 0 );
    $table->addWidget( Qt::Label( this->tr( 'To-hit' ) ),       7, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Shots' ) ),        8, 0 );

    $table->addWidget( Qt::Label( this->tr( '[0, +2] (tbd)' ) ),  0, 1 );
    # spacer
    $table->addWidget( Qt::Label( this->tr( '1d1, +3 (tbd)' ) ),  2, 1 );
    $table->addWidget( Qt::Label( this->tr( '24, +4 (tbd)' ) ),   3, 1 );
    $table->addWidget( Qt::Label( this->tr( '3.0/turn (tbd)' ) ), 4, 1 );
    # spacer
    $table->addWidget( Qt::Label( this->tr( '+0 (tbd)' ) ),       6, 1 );
    $table->addWidget( Qt::Label( this->tr( '19, +4 (tbd)' ) ),   7, 1 );
    $table->addWidget( Qt::Label( this->tr( '0/turn (tbd)' ) ),   8, 1 );

    my $groupBox = Qt::GroupBox();
    $groupBox->setLayout( $table );
    return $groupBox;
}

sub detailedThree {
    my $table = Qt::GridLayout();

    $table->addWidget( Qt::Label( this->tr( 'Saving Throw' ) ), 0, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Stealth' ) ),      1, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Disarming' ) ),    2, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Magic Device' ) ), 3, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Perception' ) ),   4, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Searching' ) ),    5, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Infravision' ) ),  6, 0 );
    $table->addWidget( Qt::Label( this->tr( '' ) ),             7, 0 );
    $table->addWidget( Qt::Label( this->tr( '' ) ),             8, 0 );

    $table->addWidget( Qt::Label( this->tr( '20% (tbd)' ) ),     0, 1 );
    $table->addWidget( Qt::Label( this->tr( 'Bad (tbd)' ) ),     1, 1 );
    $table->addWidget( Qt::Label( this->tr( '26% (tbd)' ) ),     2, 1 );
    $table->addWidget( Qt::Label( this->tr( '19 (tbd)' ) ),      3, 1 );
    $table->addWidget( Qt::Label( this->tr( '1 in 38 (tbd)' ) ), 4, 1 );
    $table->addWidget( Qt::Label( this->tr( '14% (tbd)' ) ),     5, 1 );
    $table->addWidget( Qt::Label( this->tr( '0 ft (tbd)' ) ),    6, 1 );

    my $groupBox = Qt::GroupBox();
    $groupBox->setLayout( $table );
    return $groupBox;
}

sub slider {
    my( $name, $value ) = @_;

    my $txt = Qt::Label( this->tr( $value || 0 ) );
    $txt->setObjectName( "slValue$name" );

    my $slider = Qt::Slider( Qt::Horizontal() );
    $slider->setObjectName( "slider$name" );
    $slider->setRange( 0, 20 );
    $slider->setValue( $value || 0 );

    this->connect( $slider, SIGNAL "actionTriggered(int)", this, SLOT "sliderValue(int)");
#    this->connect( $slider, SIGNAL "valueChanged(int)", $txt, SLOT "setNum(int)" );

    my $paar = Qt::GridLayout();
    $paar->addWidget( $txt, 0, 0 );
    $paar->setColumnMinimumWidth( 0, 13 );
    $paar->addWidget( $slider, 0, 1 );

    return $paar;
}

# getters & setters
sub name { return this->{nameLineEdit} }

sub setName { this->{nameLineEdit} = shift }

sub nameLabel { return this->{nameLabel} }

sub setNameLabel { this->{nameLabel} = shift }

sub charTxtInfo { return this->{charTxtInfo} }

sub setCharTxtInfo { this->{charTxtInfo} = shift }

sub char { return this->{character} }

# shortcuts
sub addSign { return this->parent->addSign( shift ) }

1;
