package Rogalik::DB;

use strict;
use warnings;

use 5.010;
use Data::Dumper;
use DBI;

use FindBin;
use File::Spec ();
use lib File::Spec->catdir( $FindBin::Bin, '../../lib' );
use Rogalik::Config;

my $dbh;

sub connect {
    # allows Rogalik::DB->setupDb() syntax
    my $self = ref $_[0] ? ref shift : shift;

    $dbh = DBI->connect( 'dbi:SQLite:dbname='.Rogalik::Config::DBFILE, "", "" ) unless $dbh;
    $dbh->do("PRAGMA foreign_keys = ON");

    return $dbh;
}

sub checkDb {
    my $self = ref $_[0] ? ref shift : shift;

    my $dbfile = shift;

#    my @driver_names = DBI->available_drivers;

#    my %drivers = DBI->installed_drivers;

}

sub execute {
    my $self = ref $_[0] ? ref shift : shift;

    my $sql = shift;

    my $dbh = $self->connect;

    unless( $sql =~ m/^select/i ) {
        my $rv = $dbh->do( $sql );

        my $rc = $dbh->err ?
                 $dbh->state :
                 0;

        $rv  ||= $dbh->err    ?
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

    my $sth = $dbh->prepare( $sql );
    my $rv  = $sth->execute() unless $sth->err;
#    say "\$rv: $rv" if $rv;

    unless( $sth->err ) {
        my $rows   = $sth->rows;
        my $result = [];

        while( my $row = $sth->fetchrow_hashref ) {
            push @$result, $row;
        }

        return ( $result, $rows, ($rv ? $rv : undef) );
    }

    return ( undef, undef, $sth->errstr );
}

1;
