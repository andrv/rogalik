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

use constant BASEDIR => File::Spec->rel2abs( File::Spec->curdir() );

# db file (SQLite)
use constant DBFILE => File::Spec->catfile( BASEDIR, 'sqlite/db' );

# TODO
# place the db into $HOME unless DEV

###

1;
