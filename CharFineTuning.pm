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
    my ( $class, @characterIds ) = @_;
    print Dumper \@characterIds;

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

    my( $result, $row, $rv ) = Rogalik::DB->execute( 'select * from theCharacter where dead is null order by updated desc' );
    $layout->addWidget( Qt::Label( this->tr( 'Sex:' ) ), 2, 1 );
    $layout->addWidget( Qt::Label( this->tr( $result->[0]->{sex} ) ), 2, 2 );
    $layout->addWidget( Qt::Label( this->tr( 'Race' ) ), 3, 1 );
    $layout->addWidget( Qt::Label( this->tr( $result->[0]->{race} ) ), 3, 2 );
    $layout->addWidget( Qt::Label( this->tr( 'Class' ) ), 4, 1 );
    $layout->addWidget( Qt::Label( this->tr( $result->[0]->{class} ) ), 4, 2 );

}

1;
