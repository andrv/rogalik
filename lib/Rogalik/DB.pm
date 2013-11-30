package Rogalik::DB;

use strict;
use warnings;

use 5.010;
use Data::Dumper;
use DBI;

use lib '../lib';
use Rogalik::Config;

sub setupDb {
    # allows Rogalik::DB->setupDb() syntax
    my $self = ref $_[0] ? ref shift : shift;

    my $dbfile = shift;
#    say "\$dbfile: $dbfile";

#    my @driver_names = DBI->available_drivers;
#    print Dumper \@driver_names;

    my $dbh = DBI->connect( "dbi:SQLite:dbname=$dbfile", "", "" );
#    my %drivers = DBI->installed_drivers;
#    print Dumper \%drivers;

    my $sql = '';
    my( $result, $rc, $rv ) = $self->execute( $sql );
}

sub execute {
    my $self = ref $_[0] ? ref shift : shift;

    my $sql = shift;
    print Dumper $sql;
}

1;
