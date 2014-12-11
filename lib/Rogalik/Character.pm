package Rogalik::Character;
#===============================================================================
#         FILE:  Character.pm
#
#  DESCRIPTION:  Class for character
#
#===============================================================================

use strict;
use warnings;

use 5.010;
use Moose;
#
#use lib 'lib';
use Rogalik::DB;

has id => (
    is       => 'ro',
    isa      => 'Int',
    required => 1,
#    trigger  => \&initialize,
);

has name => (
    is      => 'rw',
    isa     => 'Str',
    lazy    => 1,
    builder => '_name',
    trigger => \&_db_sync,
);

sub _name {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'name', $self->id ) || '';
}

has sex => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    builder => '_sex',
);

sub _sex {
    my $self = shift;
    return Rogalik::DB->get( 'theCharacter', 'sex', $self->id );
}

has race => (
    is      => 'ro',
    isa     => 'HashRef[Str|Int]',
    lazy    => 1,
    builder => '_race',
);

sub _race {
    my $self = shift;
    my( $res, $rows, $rv ) = Rogalik::DB->execute(
        "select r.id, r.name as race from theRace r, theCharacter ch where ch.id = @{[$self->id]} and ch.race = r.id"
    );
    return { id => $res->[0]->{id}, name => $res->[0]->{race} };
}

sub _db_sync {
    my( $self, $new, $old ) = @_;
    Rogalik::DB->set( 'theCharacter', 'name', "'$new'", $self->id );
    Rogalik::DB->set( 'theCharacter', 'updated', "datetime( 'now' )", $self->id );
}

#sub initialize {
#    my $self = shift;
#
#    $self->name( Rogalik::DB->get( 'theCharacter', 'name', $self->id ) );
#}

no Moose;
__PACKAGE__->meta->make_immutable;
