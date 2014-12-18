#===============================================================================
#  DESCRIPTION:  tests for class Rogalik
#
#      CREATED:  11.12.2014 14:56:46
#===============================================================================

use strict;
use warnings;

use Data::Dumper;
use Test::More;

use FindBin;
use lib "$FindBin::Bin/../lib";
use Rogalik::DB;

use_ok( 'Rogalik::Character' );
can_ok( 'Rogalik::Character', 'id', 'name', 'sex', 'race', 'class', 'lvl', 'title' );

my( $res, $rows, $rv ) = Rogalik::DB->execute(
    "insert into theCharacter( name, sex, race, class, updated ) values( ".
    "'Elektrodrel'".
    ", 'Female'".
    ", 10".
    ", 2".
    ", datetime( 'now', 'localtime' )".
    " )"
);

( $res, $rows, $rv ) = Rogalik::DB->execute(
    "select last_insert_rowid() as id"
);
my $magicCharId = $res->[0]->{id};

( $res, $rows, $rv ) = Rogalik::DB->execute(
    "insert into theCharacter( name, sex, race, class, updated ) values( ".
    "'Baralgin'".
    ", 'Male'".
    ", 1".
    ", 1".
    ", datetime( 'now', 'localtime' )".
    " )"
);

( $res, $rows, $rv ) = Rogalik::DB->execute(
    "select last_insert_rowid() as id"
);
my $nonMagicCharId = $res->[0]->{id};

( $res, $rows, $rv ) = Rogalik::DB->execute(
    "insert into theCharacter( name, sex, race, class, updated ) values( ".
    "'Golyi'".
    ", 'Neuter'".
    ", 4".
    ", 4".
    ", datetime( 'now', 'localtime' )".
    " )"
);

( $res, $rows, $rv ) = Rogalik::DB->execute(
    "select last_insert_rowid() as id"
);
my $neuterCharId = $res->[0]->{id};

my $magicChar    = new_ok( 'Rogalik::Character' => [ id => $magicCharId ], 'Rogalik::Character' );
my $nonMagicChar = new_ok( 'Rogalik::Character' => [ id => $nonMagicCharId ], 'Rogalik::Character' );
my $neuterChar   = new_ok( 'Rogalik::Character' => [ id => $neuterCharId ], 'Rogalik::Character' );

ok( $nonMagicChar->class->magicless, 'magicless works for non magic chars' );
ok( !$magicChar->class->magicless,   'magicless works for magic chars' );

( $res, $rows, $rv ) = Rogalik::DB->execute(
    "delete from theCharacter"
);

done_testing();
