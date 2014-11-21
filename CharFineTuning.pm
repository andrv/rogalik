package CharFineTuning;

use strict;
use warnings;

use 5.010;
use Data::Dumper;

use QtCore4;
use QtGui4;
use QtCore4::isa qw( Qt::Widget );

use lib 'lib';
use Rogalik::DB;


sub NEW {
    my ( $class, $characterId ) = @_;

    $class->SUPER::NEW();

    this->setWindowTitle( 'Fine tuning' );

    # main layout
    my $layout = Qt::GridLayout( this );

    # left placeholder
    $layout->setColumnMinimumWidth( 0, 20 );

    # invitation for name input
    this->setNameLabel( Qt::Label( this->tr( 'Enter a name for your character:' ) ) );
    $layout->addWidget(
        this->nameLabel(),
        0, 1,
    );
    
    # name input field
    this->setName( Qt::LineEdit() );
    $layout->addWidget( this->name(), 0, 2, 1, 2 );

    $layout->addWidget( this->basicsOne( $characterId ), 1, 1 );

    # empty space
    $layout->setColumnMinimumWidth( 2, 20 );

    $layout->addWidget( this->basicsTwo(), 1, 3 );

    # empty space
    $layout->setColumnMinimumWidth( 4, 20 );

    $layout->addWidget( this->qualities(), 1, 5 );

    # space between top and middle
    $layout->setRowMinimumHeight( 2, 20 );

    $layout->addWidget( this->detailedOne(),   3, 1 );
    $layout->addWidget( this->detailedTwo(),   3, 3 );
    $layout->addWidget( this->detailedThree(), 3, 5 );

    # space between middle and bottom
    $layout->setRowMinimumHeight( 4, 20 );

    this->setCharTxtInfo( Qt::Label( this->tr( '(tbd) You are one of several children of a Yeoman. You are the black sheep of the family. You have dark brown eyes, curly blond hair, and a very dark complexion. (tbd) Bla, bla, bla.' ) ) );
    this->charTxtInfo()->setWordWrap( 1 );
    $layout->addWidget(
        this->charTxtInfo(),
        5, 1,
        1, 5,
        Qt::AlignTop(),
    );

    # space after bottom
    $layout->setRowMinimumHeight( 6, 20 );

    # space at right edge
    $layout->setColumnMinimumWidth( 6, 20 );
}

sub basicsOne {
    my $charId = shift;

    my $table = Qt::GridLayout();

    my( $res, $row, $rv ) = Rogalik::DB->execute( "select name, sex, race, class from theCharacter where id = $charId" );

    $table->addWidget( Qt::Label( this->tr( 'Name' ) ),             0, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Sex' ) ),              1, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Race' ) ),             2, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Class' ) ),            3, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Title' ) ),            4, 0 );
    $table->addWidget( Qt::Label( this->tr( 'HP' ) ),               5, 0 );
    $table->addWidget( Qt::Label( this->tr( 'SP' ) ),               6, 0 );

    this->{charName} = Qt::Label( this->tr( $res->[0]->{name} ) );
    $table->addWidget( this->{charName},                            0, 1 );
    $table->addWidget( Qt::Label( this->tr( $res->[0]->{sex} ) ),   1, 1 );
    $table->addWidget( Qt::Label( this->tr( $res->[0]->{race} ) ),  2, 1 );
    $table->addWidget( Qt::Label( this->tr( $res->[0]->{class} ) ), 3, 1 );
    $table->addWidget( Qt::Label( this->tr( 'Rookie (tbd)' ) ),     4, 1 );
    $table->addWidget( Qt::Label( this->tr( '19/19 (tbd)' ) ),      5, 1 );
    $table->addWidget( Qt::Label( this->tr( '0/0 (tbd)' ) ),        6, 1 );

    my $groupBox = Qt::GroupBox();
    $groupBox->setLayout( $table );
    return $groupBox;
}

sub basicsTwo {
    my $table = Qt::GridLayout();

    $table->addWidget( Qt::Label( this->tr( '' ) ),             0, 0 ); # placeholder
    $table->addWidget( Qt::Label( this->tr( 'Age' ) ),          1, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Height' ) ),       2, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Weight' ) ),       3, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Social' ) ),       4, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Maximize' ) ),     5, 0 );

    $table->addWidget( Qt::Label( this->tr( '19 (tbd)' ) ),     1, 1 );
    $table->addWidget( Qt::Label( this->tr( '71 (tbd)' ) ),     2, 1 );
    $table->addWidget( Qt::Label( this->tr( '139 (tbd)' ) ),    3, 1 );
    $table->addWidget( Qt::Label( this->tr( 'Pariah (tbd)' ) ), 4, 1 );
    $table->addWidget( Qt::Label( this->tr( 'Yes (tbd)' ) ),    5, 1 );
    $table->addWidget( Qt::Label( this->tr( '' ) ),             6, 1 ); # placeholder

    my $groupBox = Qt::GroupBox();
    $groupBox->setLayout( $table );
    return $groupBox;
}

sub qualities {
    my $table = Qt::GridLayout();

    $table->addWidget( Qt::Label( this->tr( 'STR:' ) ),        1, 0 );
    $table->addWidget( Qt::Label( this->tr( 'INT:' ) ),        2, 0 );
    $table->addWidget( Qt::Label( this->tr( 'WIS:' ) ),        3, 0 );
    $table->addWidget( Qt::Label( this->tr( 'DEX:' ) ),        4, 0 );
    $table->addWidget( Qt::Label( this->tr( 'CON:' ) ),        5, 0 );
    $table->addWidget( Qt::Label( this->tr( 'CHR:' ) ),        6, 0 );

    # empty space
    $table->setColumnMinimumWidth( 1, 10 );
    $table->addWidget( Qt::Label( this->tr( 'Self' ) ),        0, 2 );
    $table->addWidget( Qt::Label( this->tr( '17 (tbd)' ) ),    1, 2 );
    $table->addWidget( Qt::Label( this->tr( '12 (tbd)' ) ),    2, 2 );
    $table->addWidget( Qt::Label( this->tr( '12 (tbd)' ) ),    3, 2 );
    $table->addWidget( Qt::Label( this->tr( '17 (tbd)' ) ),    4, 2 );
    $table->addWidget( Qt::Label( this->tr( '14 (tbd)' ) ),    5, 2 );
    $table->addWidget( Qt::Label( this->tr( '10 (tbd)' ) ),    6, 2 );

    # empty space
    $table->setColumnMinimumWidth( 3, 10 );
    $table->addWidget( Qt::Label( this->tr( 'RB' ) ),          0, 4 );
    $table->addWidget( Qt::Label( this->tr( '+0 (tbd)' ) ),    1, 4 );
    $table->addWidget( Qt::Label( this->tr( '+0 (tbd)' ) ),    2, 4 );
    $table->addWidget( Qt::Label( this->tr( '+0 (tbd)' ) ),    3, 4 );
    $table->addWidget( Qt::Label( this->tr( '+0 (tbd)' ) ),    4, 4 );
    $table->addWidget( Qt::Label( this->tr( '+0 (tbd)' ) ),    5, 4 );
    $table->addWidget( Qt::Label( this->tr( '+0 (tbd)' ) ),    6, 4 );

    # empty space
    $table->setColumnMinimumWidth( 5, 10 );
    $table->addWidget( Qt::Label( this->tr( 'CB' ) ),          0, 6 );
    $table->addWidget( Qt::Label( this->tr( '+5 (tbd)' ) ),    1, 6 );
    $table->addWidget( Qt::Label( this->tr( '-2 (tbd)' ) ),    2, 6 );
    $table->addWidget( Qt::Label( this->tr( '-2 (tbd)' ) ),    3, 6 );
    $table->addWidget( Qt::Label( this->tr( '+2 (tbd)' ) ),    4, 6 );
    $table->addWidget( Qt::Label( this->tr( '+2 (tbd)' ) ),    5, 6 );
    $table->addWidget( Qt::Label( this->tr( '-1 (tbd)' ) ),    6, 6 );

    # empty space
    $table->setColumnMinimumWidth( 7, 10 );
    $table->addWidget( Qt::Label( this->tr( 'EB' ) ),          0, 8 );
    $table->addWidget( Qt::Label( this->tr( '+0 (tbd)' ) ),    1, 8 );
    $table->addWidget( Qt::Label( this->tr( '+0 (tbd)' ) ),    2, 8 );
    $table->addWidget( Qt::Label( this->tr( '+0 (tbd)' ) ),    3, 8 );
    $table->addWidget( Qt::Label( this->tr( '+0 (tbd)' ) ),    4, 8 );
    $table->addWidget( Qt::Label( this->tr( '+0 (tbd)' ) ),    5, 8 );
    $table->addWidget( Qt::Label( this->tr( '+0 (tbd)' ) ),    6, 8 );

    # empty space
    $table->setColumnMinimumWidth( 9, 10 );
    $table->addWidget( Qt::Label( this->tr( 'Self' ) ),        0, 10 );
    $table->addWidget( Qt::Label( this->tr( '18/40 (tbd)' ) ), 1, 10 );
    $table->addWidget( Qt::Label( this->tr( '10 (tbd)' ) ),    2, 10 );
    $table->addWidget( Qt::Label( this->tr( '10 (tbd)' ) ),    3, 10 );
    $table->addWidget( Qt::Label( this->tr( '18/10 (tbd)' ) ), 4, 10 );
    $table->addWidget( Qt::Label( this->tr( '16 (tbd)' ) ),    5, 10 );
    $table->addWidget( Qt::Label( this->tr( '9 (tbd)' ) ),     6, 10 );

    my $groupBox = Qt::GroupBox();
    $groupBox->setLayout( $table );
    return $groupBox;
}

sub detailedOne {
    my $table = Qt::GridLayout();

    $table->addWidget( Qt::Label( this->tr( 'Level' ) ),          0, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Cur Exp' ) ),        1, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Max Exp' ) ),        2, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Adv Exp' ) ),        3, 0 );
    $table->addWidget( Qt::Label( this->tr( 'MaxDepth' ) ),       4, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Game Turns' ) ),     5, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Standard Turns' ) ), 6, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Resting Turns' ) ),  7, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Gold' ) ),           8, 0 );

    $table->addWidget( Qt::Label( this->tr( '1 (tbd)' ) ),    0, 1 );
    $table->addWidget( Qt::Label( this->tr( '0 (tbd)' ) ),    1, 1 );
    $table->addWidget( Qt::Label( this->tr( '0 (tbd)' ) ),    2, 1 );
    $table->addWidget( Qt::Label( this->tr( '10 (tbd)' ) ),   3, 1 );
    $table->addWidget( Qt::Label( this->tr( 'Town (tbd)' ) ), 4, 1 );
    $table->addWidget( Qt::Label( this->tr( '1 (tbd)' ) ),    5, 1 );
    $table->addWidget( Qt::Label( this->tr( '0 (tbd)' ) ),    6, 1 );
    $table->addWidget( Qt::Label( this->tr( '0 (tbd)' ) ),    7, 1 );
    $table->addWidget( Qt::Label( this->tr( '600 (tbd)' ) ),  8, 1 );

    my $groupBox = Qt::GroupBox();
    $groupBox->setLayout( $table );
    return $groupBox;
}

sub detailedTwo {
    my $table = Qt::GridLayout();

    $table->addWidget( Qt::Label( this->tr( 'Armor' ) ),  0, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Fight' ) ),  1, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Melee' ) ),  2, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Shoot' ) ),  3, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Blows' ) ),  4, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Shots' ) ),  5, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Infra' ) ),  6, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Speed' ) ),  7, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Burden' ) ), 8, 0 );

    $table->addWidget( Qt::Label( this->tr( '[0, +2] (tbd)' ) ),  0, 1 );
    $table->addWidget( Qt::Label( this->tr( '(+4, +3) (tbd)' ) ), 1, 1 );
    $table->addWidget( Qt::Label( this->tr( '(+4, +3) (tbd)' ) ), 2, 1 );
    $table->addWidget( Qt::Label( this->tr( '(+4, +0) (tbd)' ) ), 3, 1 );
    $table->addWidget( Qt::Label( this->tr( '3.7/turn (tbd)' ) ), 4, 1 );
    $table->addWidget( Qt::Label( this->tr( '0/turn (tbd)' ) ),   5, 1 );
    $table->addWidget( Qt::Label( this->tr( '0 ft (tbd)' ) ),     6, 1 );
    $table->addWidget( Qt::Label( this->tr( 'Normal (tbd)' ) ),   7, 1 );
    $table->addWidget( Qt::Label( this->tr( '0.0lbs (tbd)' ) ),   8, 1 );

    my $groupBox = Qt::GroupBox();
    $groupBox->setLayout( $table );
    return $groupBox;
}

sub detailedThree {
    my $table = Qt::GridLayout();

    $table->addWidget( Qt::Label( this->tr( 'Saving Throw' ) ),  0, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Stealth' ) ),       1, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Fighting' ) ),      2, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Shooting' ) ),      3, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Disarming' ) ),     4, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Magic Device' ) ),  5, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Perception' ) ),    6, 0 );
    $table->addWidget( Qt::Label( this->tr( 'Searching' ) ),     7, 0 );
    $table->addWidget( Qt::Label( this->tr( '' ) ),              8, 0 );

    $table->addWidget( Qt::Label( this->tr( '20% (tbd)' ) ),       0, 1 );
    $table->addWidget( Qt::Label( this->tr( 'Poor (tbd)' ) ),      1, 1 );
    $table->addWidget( Qt::Label( this->tr( 'Very Good (tbd)' ) ), 2, 1 );
    $table->addWidget( Qt::Label( this->tr( 'Fair (tbd)' ) ),      3, 1 );
    $table->addWidget( Qt::Label( this->tr( '26% (tbd)' ) ),       4, 1 );
    $table->addWidget( Qt::Label( this->tr( '19 (tbd)' ) ),        5, 1 );
    $table->addWidget( Qt::Label( this->tr( '1 in 38 (tbd)' ) ),   6, 1 );
    $table->addWidget( Qt::Label( this->tr( '14% (tbd)' ) ),       7, 1 );

    my $groupBox = Qt::GroupBox();
    $groupBox->setLayout( $table );
    return $groupBox;
}

# getters & setters
sub name { return this->{nameLineEdit} }

sub setName { this->{nameLineEdit} = shift }

sub nameLabel { return this->{nameLabel} }

sub setNameLabel { this->{nameLabel} = shift }

sub charTxtInfo { return this->{charTxtInfo} }

sub setCharTxtInfo { this->{charTxtInfo} = shift }

1;
