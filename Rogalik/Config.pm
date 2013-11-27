package Rogalik::Config;

use strict;
use warnings;

use 5.010;

use FindBin;

### initial config ###
# enviroment
use constant DEV => (
    -e './.git' ?
    1 :
    0
);

# db file (SQLite)
my $dbPath = File::Spec->catdir(
    $FindBin::Bin,
    'sqlite',
);

use constant DBFILE => File::Spec->catdir( $dbPath, 'db' );
# TODO
# place the db into $HOME unless DEV

###

1;
