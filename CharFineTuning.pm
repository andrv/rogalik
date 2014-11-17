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

    # invitation for name
    $layout->addWidget(
        Qt::Label( this->tr( 'Enter a name for your character:' ) ),
        0, 1,
#        1, 3,
#        Qt::AlignHCenter() | Qt::AlignBottom(),
    );
    
    $layout->addWidget( Qt::Label( this->tr( 'Name:' ) ), 1, 1 );

    my( $result, $row, $rv ) = Rogalik::DB->execute( "select name, sex, race, class from theCharacter where id = $characterId" );
    $layout->addWidget( Qt::Label( this->tr( 'Sex:' ) ),                2, 1 );
    $layout->addWidget( Qt::Label( this->tr( $result->[0]->{sex} ) ),   2, 2 );
    $layout->addWidget( Qt::Label( this->tr( 'Race' ) ),                3, 1 );
    $layout->addWidget( Qt::Label( this->tr( $result->[0]->{race} ) ),  3, 2 );
    $layout->addWidget( Qt::Label( this->tr( 'Class' ) ),               4, 1 );
    $layout->addWidget( Qt::Label( this->tr( $result->[0]->{class} ) ), 4, 2 );
    $layout->addWidget( Qt::Label( this->tr( 'Title' ) ),               5, 1 );

    $layout->addWidget( Qt::Label( this->tr( 'HP' ) ),                  6, 1 );

    $layout->addWidget( Qt::Label( this->tr( 'SP' ) ),                  7, 1 );


    # empty space
    $layout->setColumnMinimumWidth( 3, 20 );
    $layout->addWidget( Qt::Label( this->tr( 'Age' ) ),                 2, 4 );

    $layout->addWidget( Qt::Label( this->tr( 'Height' ) ),              3, 4 );

    $layout->addWidget( Qt::Label( this->tr( 'Wrght' ) ),               4, 4 );

    $layout->addWidget( Qt::Label( this->tr( 'Social' ) ),              5, 4 );

    $layout->addWidget( Qt::Label( this->tr( 'Maximize' ) ),            6, 4 );
    $layout->addWidget( Qt::Label( this->tr( 'Yes' ) ),                 6, 5 );


    # empty space
    $layout->setColumnMinimumWidth( 6, 20 );
    $layout->addWidget( Qt::Label( this->tr( 'STR:' ) ),            2, 7 );
    $layout->addWidget( Qt::Label( this->tr( 'INT:' ) ),            3, 7 );
    $layout->addWidget( Qt::Label( this->tr( 'WIS:' ) ),            4, 7 );
    $layout->addWidget( Qt::Label( this->tr( 'DEX:' ) ),            5, 7 );
    $layout->addWidget( Qt::Label( this->tr( 'CON:' ) ),            6, 7 );
    $layout->addWidget( Qt::Label( this->tr( 'CHR:' ) ),            7, 7 );


    # empty space
    $layout->setColumnMinimumWidth( 8, 10 );
    $layout->addWidget( Qt::Label( this->tr( 'Self' ) ),            1, 9 );
    $layout->addWidget( Qt::Label( this->tr( '17' ) ),              2, 9 );
    $layout->addWidget( Qt::Label( this->tr( '12' ) ),              3, 9 );
    $layout->addWidget( Qt::Label( this->tr( '12' ) ),              4, 9 );
    $layout->addWidget( Qt::Label( this->tr( '17' ) ),              5, 9 );
    $layout->addWidget( Qt::Label( this->tr( '14' ) ),              6, 9 );
    $layout->addWidget( Qt::Label( this->tr( '10' ) ),              7, 9 );


    # empty space
    $layout->setColumnMinimumWidth( 10, 10 );
    $layout->addWidget( Qt::Label( this->tr( 'RB' ) ),              1, 11 );
    $layout->addWidget( Qt::Label( this->tr( '+0' ) ),              2, 11 );
    $layout->addWidget( Qt::Label( this->tr( '+0' ) ),              3, 11 );
    $layout->addWidget( Qt::Label( this->tr( '+0' ) ),              4, 11 );
    $layout->addWidget( Qt::Label( this->tr( '+0' ) ),              5, 11 );
    $layout->addWidget( Qt::Label( this->tr( '+0' ) ),              6, 11 );
    $layout->addWidget( Qt::Label( this->tr( '+0' ) ),              7, 11 );


    # empty space
    $layout->setColumnMinimumWidth( 12, 10 );
    $layout->addWidget( Qt::Label( this->tr( 'CB' ) ),              1, 13 );
    $layout->addWidget( Qt::Label( this->tr( '+5' ) ),              2, 13 );
    $layout->addWidget( Qt::Label( this->tr( '-2' ) ),              3, 13 );
    $layout->addWidget( Qt::Label( this->tr( '-2' ) ),              4, 13 );
    $layout->addWidget( Qt::Label( this->tr( '+2' ) ),              5, 13 );
    $layout->addWidget( Qt::Label( this->tr( '+2' ) ),              6, 13 );
    $layout->addWidget( Qt::Label( this->tr( '-1' ) ),              7, 13 );


    # empty space
    $layout->setColumnMinimumWidth( 14, 10 );
    $layout->addWidget( Qt::Label( this->tr( 'EB' ) ),              1, 15 );
    $layout->addWidget( Qt::Label( this->tr( '+0' ) ),              2, 15 );
    $layout->addWidget( Qt::Label( this->tr( '+0' ) ),              3, 15 );
    $layout->addWidget( Qt::Label( this->tr( '+0' ) ),              4, 15 );
    $layout->addWidget( Qt::Label( this->tr( '+0' ) ),              5, 15 );
    $layout->addWidget( Qt::Label( this->tr( '+0' ) ),              6, 15 );
    $layout->addWidget( Qt::Label( this->tr( '+0' ) ),              7, 15 );


    # empty space
    $layout->setColumnMinimumWidth( 16, 10 );
    $layout->addWidget( Qt::Label( this->tr( 'Self' ) ),            1, 17 );
    $layout->addWidget( Qt::Label( this->tr( '18/40' ) ),           2, 17 );
    $layout->addWidget( Qt::Label( this->tr( '10' ) ),              3, 17 );
    $layout->addWidget( Qt::Label( this->tr( '10' ) ),              4, 17 );
    $layout->addWidget( Qt::Label( this->tr( '18/10' ) ),           5, 17 );
    $layout->addWidget( Qt::Label( this->tr( '16' ) ),              6, 17 );
    $layout->addWidget( Qt::Label( this->tr( '9' ) ),               7, 17 );
}

1;
