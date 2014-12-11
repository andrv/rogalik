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
