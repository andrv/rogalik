package ChooseCharacter;

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
    $class->SUPER::NEW();

    this->setWindowTitle( 'Choose character' );

    this->{charactersComboBox} = this->createCombo( @characterIds );

    # main layout
    my $layout = Qt::GridLayout( this );

    # left placeholder
    $layout->setColumnMinimumWidth( 0, 20 );

    $layout->addWidget(
        Qt::Label( this->tr( 'Non dead character exists'.
                "\n".
                'Please choose one:'
        ) ),
        0, 1,
#        1, 3,
#        Qt::AlignHCenter() | Qt::AlignBottom(),
    );

    $layout->addWidget( this->characters(), 1, 1 );
}

sub createCombo {
    my @characterIds = @_;

    my $combo = Qt::ComboBox();

    foreach my $id( @characterIds ) {
        my( $res, $rows, $rv ) = Rogalik::DB->execute( "select id, name, sex, race, class, updated from theCharacter where id = $id" );
        my $char = $res->[0];
        my $name = $char->{name} || 'No name yet';

        $combo->addItem( this->tr( "$char->{id}: $name, $char->{sex}, $char->{race}, $char->{class}, $char->{updated}" ) );
    }

    $combo->addItem( this->tr( 'Add new one' ) );

    return $combo;
}

# getters
sub characters { return this->{charactersComboBox} }

1;
