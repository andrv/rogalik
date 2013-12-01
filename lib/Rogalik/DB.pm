package Rogalik::DB;

use strict;
use warnings;

use 5.010;
use Data::Dumper;
use DBI;

use lib '../lib';
use Rogalik::Config;

my $dbh;

sub connect {
    # allows Rogalik::DB->setupDb() syntax
    my $self = ref $_[0] ? ref shift : shift;

    $dbh = DBI->connect( 'dbi:SQLite:dbname='.Rogalik::Config::DBFILE, "", "" ) unless $dbh;

    return $dbh;
}

sub setupDb {
    my $self = ref $_[0] ? ref shift : shift;

    my $dbfile = shift;

#    my @driver_names = DBI->available_drivers;

#    my %drivers = DBI->installed_drivers;

    my $sql = 'CREATE TABLE IF NOT EXISTS sex (
        id      INTEGER,
        guiId   INTEGER,
        guiText TEXT,
        PRIMARY KEY( id ASC ) )';
    my( $result, $rv ) = $self->execute( $sql );

    say "$result, $rv";

    ( $result, $rv ) = $self->execute(
        "INSERT INTO sex ( guiId, guiText ) VALUES ( 1, 'Female' )"
    );
    ( $result, $rv ) = $self->execute(
        "INSERT INTO sex ( guiId, guiText ) VALUES ( 2, 'Male' )"
    );
    ( $result, $rv ) = $self->execute(
        "INSERT INTO sex ( guiId, guiText ) VALUES ( 3, 'Neuter' )"
    );
}

sub execute {
    my $self = ref $_[0] ? ref shift : shift;

    my $sql = shift;

    my $dbh = $self->connect;

    unless( $sql =~ m/^select/i ) {
        $dbh->do( $sql );

        my $rc = $dbh->err ?
                 $dbh->err :
                 0;

        my $rv = $dbh->err    ?
                 $dbh->errstr :
                 'successful';

        return ( $sql, $rv, $rc );
#        say '$dbh->err: '.$dbh->err;
#        say '$dbh->errstr: '.$dbh->errstr;
#        say '$dbh->state: '.$dbh->state;
#DBD::SQLite::db do failed: table sex has no column named x at lib/Rogalik/DB.pm line 51.
# CREATE TABLE
#$dbh->err: 1
#$dbh->errstr: table sex has no column named x
#$dbh->state: S1000
    }
}

1;
