package Rogalik::DB;

use strict;
use warnings;

use 5.010;
use lib '../lib';
use Rogalik::Config;

sub setupDb {
    # allows Rogalik::DB->setupDb() syntax
    my $class = ref $_[0] ? ref shift : shift;

    my $dbfile = shift;
    say "\$dbfile: $dbfile";
}

1;
