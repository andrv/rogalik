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
my $dbPath = File::Spec->catdir(
    $FindBin::Bin,
    'sqlite',
);
say "\$dbPath: $dbPath";
use constant DBFILE => File::Spec->catfile( $dbPath, 'db' );
say 'DBFILE: '. DBFILE;
#my $DBFILE = File::Spec->catfile( $dbPath, 'db' );
#say '$DBFILE: '. $DBFILE;
# TODO
# place the db into $HOME unless DEV

###

1;
