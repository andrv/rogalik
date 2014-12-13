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
use ChooseCharacter;

use QtCore4::slots
    nextStep     => [];

use lib 'lib';
use Rogalik::DB;

sub NEW {
    my ( $class, @characterIds ) = @_;
    $class->SUPER::NEW();

    # display screens depending on existence of alive characters
    if( @characterIds ) {
        # alive characters exists
        my $chooseCharacter = ChooseCharacter( @characterIds );
        this->setCentralWidget( $chooseCharacter );
    }
    else {
        my $CharCreation = CharacterCreation();
        this->setCentralWidget( $CharCreation );
    }


    # initial
    this->setGeometry( 100, 100, 800, 600 );

    Qt::Shortcut( Qt::KeySequence( ${Qt::CTRL() + Qt::Key_Q()} ), this, SLOT 'close()' );
    Qt::Shortcut( Qt::KeySequence( ${Qt::Key_Enter()} ), this, SLOT 'nextStep()' );
    Qt::Shortcut( Qt::KeySequence( ${Qt::Key_Return()} ), this, SLOT 'nextStep()' );
}

# slots
sub nextStep {
    my $centralWidget = this->centralWidget()->windowTitle();

    if( $centralWidget eq 'Character creation' ) {
        if( this->sex()->currentIndex() ) {
            this->race()->setEnabled( 1 );
            this->race()->setFocus();

            if( this->race()->currentIndex() ) {
                this->class()->setEnabled( 1 );
                this->class()->setFocus();

                if( this->class()->currentIndex() ) {
                    my( $res, $rows, $rv ) = Rogalik::DB->execute(
                        "insert into theCharacter( sex, race, class, updated ) values( '" .
                        this->sex()->currentText() . "', '" .
                        this->race()->currentIndex() . "', '" .
                        this->class()->currentIndex() . "', " .
                        "datetime( 'now', 'localtime' ) " .
                        ")"
                    );

                    ( $res, $rows, $rv ) = Rogalik::DB->execute(
                        "select last_insert_rowid() as id" );
                    this->setCurrentCharId( $res->[0]->{id} );

                    ### next screen
                    this->setCentralWidget( CharFineTuning( this->currentCharId() ) );
                    this->centralWidget()->name()->setFocus();
                }
            }
        }
    }
    elsif( $centralWidget eq 'Choose character' ) {
        my $choosen = this->centralWidget()->{charactersComboBox}->currentText();

        if( $choosen eq 'Add new one' ) {
            this->setCentralWidget( CharacterCreation() );
            this->sex()->setFocus();
        }
        else {
            my( $charId ) = $choosen =~ m/^(\d+):.*/;
            this->setCurrentCharId( int $charId );
            this->setCentralWidget( CharFineTuning( this->currentCharId() ) );

            if( Rogalik::DB->get( 'theCharacter', 'name', this->currentCharId() ) ) {
                this->centralWidget()->nameLabel()->hide();
                this->centralWidget()->name()->hide();
            }
            else {
                this->centralWidget()->name()->setFocus();
            }
        }
    }
    elsif( $centralWidget eq 'Fine tuning' ) {
        unless( this->centralWidget->char->name ) {
            this->centralWidget->char->name( this->centralWidget()->name()->text() );
            this->centralWidget()->{charName}->setText( this->tr( this->centralWidget->char->name ) );
            this->centralWidget()->name()->setDisabled( 1 );
        }
    }
}


# getters
sub sex { return this->centralWidget()->{sexComboBox} }

sub race { return this->centralWidget()->{raceComboBox} }

sub class { return this->centralWidget()->{classComboBox} }

sub currentCharId { return this->{currentCharId} }

# setters
sub setCurrentCharId { this->{currentCharId} = shift }

#sub _different {
#    my( $old, $new ) = @_;
#
#    return 1 if $old ne $new;
#    return;
#}

1;
