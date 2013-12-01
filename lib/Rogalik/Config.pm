package Rogalik::Config;

use strict;
use warnings;

use 5.010;

use FindBin;
use File::Spec ();

### initial config ###
# enviroment
use constant DEV => (
    -e './.git' ?
    1 :
    0
);

# db file (SQLite)
use constant DBFILE => (
    DEV                     ?
    ':memory:'              :
    File::Spec->catfile(
        File::Spec->catdir(
            $FindBin::Bin,
            'sqlite'
        ),
        'db'
    )
);

# TODO
# place the db into $HOME unless DEV

###

1;
