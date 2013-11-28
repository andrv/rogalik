package Rogalik::DB;

use strict;
use warnings;

use 5.010;

sub setupDb {
    # allows Rogalik::DB->setupDb() syntax
    my $class = ref $_[0] ? ref shift : shift;

    my $databaseFile = shift;
    say $databaseFile;
}

1;
