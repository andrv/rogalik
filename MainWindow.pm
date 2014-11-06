package MainWindow;

use strict;
use warnings;

use 5.010;
use Data::Dumper;

use QtCore4;
use QtGui4;
use QtCore4::isa qw( Qt::MainWindow );

use CharacterCreation;
use CharFineTuning;

use QtCore4::slots
    nextStep     => [];

use lib 'lib';
use Rogalik::DB;

sub NEW {
    my ( $class ) = @_;
    $class->SUPER::NEW();

    my $CharCreation = CharacterCreation();
    this->setCentralWidget( $CharCreation );

    # initial
    this->setGeometry( 100, 100, 800, 600 );

    Qt::Shortcut( Qt::KeySequence( ${Qt::CTRL() + Qt::Key_Q()} ), this, SLOT 'close()' );
    Qt::Shortcut( Qt::KeySequence( ${Qt::Key_Enter()} ), this, SLOT 'nextStep()' );
    Qt::Shortcut( Qt::KeySequence( ${Qt::Key_Return()} ), this, SLOT 'nextStep()' );
}

# slots
sub nextStep {
    if( this->centralWidget()->windowTitle() eq 'Character creation' ) {
        if( this->sex()->currentIndex() ) {
            this->race()->setEnabled( 1 );
            this->race()->setFocus();

            if( this->race()->currentIndex() ) {
                this->class()->setEnabled( 1 );
                this->class()->setFocus();

                if( this->class()->currentIndex() ) {
                    my( $result, $rows, $rv ) = Rogalik::DB->execute(
                        "insert into theCharacter( sex, race, class ) values( '" .
                        this->sex()->currentText() . "', '" .
                        this->race()->currentText() . "', '" .
                        this->class()->currentText() . "'" .
                        ")"
                    );

                    ### next screen
                    my $CharFineTuning = CharFineTuning();
                    this->setCentralWidget( $CharFineTuning );
                }
            }
        }
    }
}


# getters
sub sex { return this->centralWidget()->{sexComboBox} }

sub race { return this->centralWidget()->{raceComboBox} }

sub class { return this->centralWidget()->{classComboBox} }

1;
