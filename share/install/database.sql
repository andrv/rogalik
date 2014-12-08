-- commands: --
-- - on the command line
--   rm sqlite/db
--   sqlite3 sqlite/db
--
-- - on sqlite prompt
--   .read share/install/database.sql
--



PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS theRace (
   id                INTEGER PRIMARY KEY ASC AUTOINCREMENT,
   name              TEXT    NOT NULL,
   strength          INTEGER NOT NULL,
   intelligence      INTEGER NOT NULL,
   wisdom            INTEGER NOT NULL,
   dexterity         INTEGER NOT NULL,
   constitution      INTEGER NOT NULL,
   disarming         INTEGER NOT NULL,
   magic_device      INTEGER NOT NULL,
   saving_throw      INTEGER NOT NULL,
   stealth           INTEGER NOT NULL,
   search_ability    INTEGER NOT NULL,
   search_freq       INTEGER NOT NULL,
   to_hit_melee      INTEGER NOT NULL,
   to_hit_bow        INTEGER NOT NULL,
   to_hit_throw      INTEGER NOT NULL,
   digging           INTEGER NOT NULL,
   hp                INTEGER NOT NULL,
   exp               INTEGER NOT NULL,
   infravision       INTEGER NOT NULL,
   history_start     INTEGER NOT NULL,
   age               INTEGER NOT NULL,
   age_mod           INTEGER NOT NULL,
   height_male       INTEGER NOT NULL,
   height_male_mod   INTEGER NOT NULL,
   height_female     INTEGER NOT NULL,
   height_female_mod INTEGER NOT NULL,
   weight_male       INTEGER NOT NULL,
   weight_male_mod   INTEGER NOT NULL,
   weight_female     INTEGER NOT NULL,
   weight_female_mod INTEGER NOT NULL
);

-- TODO: translate height and weight into cm and kg ;-)
INSERT INTO theRace VALUES(  1, 'Human',       0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 10,   0,   0,   0,  0, 10, 100, 0,  1,  14,  6, 72,  6, 66,  4, 180, 25, 150, 20 );
INSERT INTO theRace VALUES(  2, 'Half-Elf',    0,  1, -1,  1, -1,  2,  3,  3,  1,  6, 11,  -1,   5,   5,  0, 10, 110, 2,  4,  24, 16, 66,  6, 62,  6, 130, 15, 100, 10 );
INSERT INTO theRace VALUES(  3, 'Elf',        -1,  2, -1,  1, -1,  5,  6,  6,  2,  8, 12,  -5,  15,  15,  0,  9, 120, 3,  5,  75, 75, 60,  4, 54,  4, 100,  6,  80,  6 );
INSERT INTO theRace VALUES(  4, 'Hobbit',     -2,  2,  1,  3,  2, 15, 18, 18,  4, 12, 15, -10,  20,  20,  0,  7, 110, 4, 10,  21, 12, 36,  3, 33,  3,  60,  3,  50,  3 );
INSERT INTO theRace VALUES(  5, 'Gnome',      -1,  2,  0,  2,  1, 10, 22, 12,  3,  6, 13,  -8,  12,  12,  0,  8, 125, 4, 13,  50, 40, 42,  3, 39,  3,  90,  6,  75,  3 );
INSERT INTO theRace VALUES(  6, 'Dwarf',       2, -3,  2, -2,  2,  2,  9,  9, -1,  7, 10,  15,   0,   0, 40, 11, 120, 5, 16,  35, 15, 48,  3, 46,  3, 150, 10, 120, 10 );
INSERT INTO theRace VALUES(  7, 'Half-Orc',    2, -1,  0,  0,  1, -3, -3, -3, -1,  0,  7,  12,  -5,  -5,  0, 10, 110, 3, 19,  11,  4, 66,  1, 62,  1, 150,  5, 120,  5 );
INSERT INTO theRace VALUES(  8, 'Half-Troll',  4, -4, -2, -4,  3, -5, -8, -8, -2, -1,  5,  20, -10, -10,  0, 12, 120, 3, 21,  20, 10, 96, 10, 84,  8, 250, 50, 225, 40 );
INSERT INTO theRace VALUES(  9, 'Dunadan',     1,  2,  2,  2,  3,  4,  5,  5,  1,  3, 13,  15,  10,  10,  0, 10, 180, 0,  1,  50, 20, 82,  5, 78,  6, 190, 20, 180, 15 );
INSERT INTO theRace VALUES( 10, 'High-Elf',    1,  3, -1,  3,  1,  4, 20, 20,  2,  3, 14,  10,  25,  25,  0, 10, 200, 4,  7, 100, 30, 90, 10, 82, 10, 190, 20, 180, 15 );
INSERT INTO theRace VALUES( 11, 'Kobold',     -1, -1,  0,  2,  2, 10,  5,  0,  3, 15, 15,  -5,  10,  10,  0,  8, 115, 5, 23,  15, 10, 38,  4, 36,  3,  70,  5,  60,  4 );

CREATE TABLE IF NOT EXISTS theClass (
   id                INTEGER PRIMARY KEY ASC AUTOINCREMENT,
   name              TEXT    NOT NULL,
   strength          INTEGER NOT NULL,
   intelligence      INTEGER NOT NULL,
   wisdom            INTEGER NOT NULL,
   dexterity         INTEGER NOT NULL,
   constitution      INTEGER NOT NULL,
   disarming         INTEGER NOT NULL,
   magic_device      INTEGER NOT NULL,
   saving_throw      INTEGER NOT NULL,
   stealth           INTEGER NOT NULL,
   search_ability    INTEGER NOT NULL,
   search_freq       INTEGER NOT NULL,
   to_hit_melee      INTEGER NOT NULL,
   to_hit_bow        INTEGER NOT NULL,
   to_hit_throw      INTEGER NOT NULL,
   digging           INTEGER NOT NULL,
   disarm_mod        INTEGER NOT NULL,
   dev_mod           INTEGER NOT NULL,
   sav_mod           INTEGER NOT NULL,
   stealth_mod       INTEGER NOT NULL,
   search_mod        INTEGER NOT NULL,
   search_freq_mod   INTEGER NOT NULL,
   hit_melee_mod     INTEGER NOT NULL,
   hit_bow_mod       INTEGER NOT NULL,
   hit_throw_mod     INTEGER NOT NULL,
   digging_mod       INTEGER NOT NULL,
   hp                INTEGER NOT NULL,
   exp               INTEGER NOT NULL,
   sense_base        INTEGER NOT NULL,
   sense_div         INTEGER NOT NULL,
   max_attacks       INTEGER NOT NULL,
   min_weight        INTEGER NOT NULL,
   att_multiply      INTEGER NOT NULL,
   spellbook_tval    INTEGER NOT NULL,
   spell_stat        INTEGER NOT NULL,
   first_lvl         INTEGER NOT NULL,
   max_weight        INTEGER NOT NULL
);

INSERT INTO theClass VALUES( 1, 'Warrior',  3, -2, -2,  2,  2, 25, 18, 18,  0, 14,  2, 70, 55, 55, 0, 10,  7, 10, 0, 0, 0, 45, 45, 45, 0, 9,  0,   7000, 40, 6, 30, 5,  0, 0, 0,   0 );
INSERT INTO theClass VALUES( 2, 'Mage',    -3,  3,  0,  0, -2, 30, 36, 30,  2, 16, 20, 34, 20, 20, 0,  7, 13,  9, 0, 0, 0, 15, 15, 15, 0, 0, 30, 170000,  5, 4, 40, 2, 90, 1, 1, 300 );
INSERT INTO theClass VALUES( 3, 'Priest',  -1, -3,  3, -1,  1, 25, 30, 32,  2, 16,  8, 48, 35, 35, 0,  7, 10, 12, 0, 0, 0, 20, 20, 20, 0, 2, 20,  15000, 40, 4, 35, 3, 91, 2, 1, 350 );
INSERT INTO theClass VALUES( 4, 'Rogue',    0,  1, -3,  3, -1, 45, 32, 28,  3, 32, 24, 60, 66, 66, 0, 15, 10, 10, 1, 0, 0, 40, 30, 30, 0, 6, 25,  10000, 40, 5, 30, 4, 90, 1, 5, 350 );
INSERT INTO theClass VALUES( 5, 'Ranger',   0,  2, -2,  1, -1, 30, 32, 28,  3, 24, 16, 56, 72, 72, 0,  8, 10, 10, 0, 0, 0, 30, 45, 45, 0, 4, 30,  20000, 40, 5, 35, 4, 90, 1, 3, 400 );
INSERT INTO theClass VALUES( 6, 'Paladin',  1, -3,  1, -1,  2, 20, 24, 25,  0, 12,  2, 68, 40, 40, 0,  7, 10, 11, 0, 0, 0, 35, 30, 30, 0, 6, 35,  60000, 40, 5, 30, 5, 91, 2, 1, 400 );

CREATE TABLE IF NOT EXISTS Flags (
   id     INTEGER PRIMARY KEY ASC AUTOINCREMENT,
   abbr   TEXT,
   desc   TEXT,
   hidden INTEGER
);

INSERT INTO Flags( abbr, desc ) VALUES( 'SUST_STR',                 'Sustains strength' );
INSERT INTO Flags( abbr, desc ) VALUES( 'SUST_DEX',                 'Sustains dexterity' );
INSERT INTO Flags( abbr, desc ) VALUES( 'SUST_CON',                 'Sustains constitution' );
INSERT INTO Flags( abbr, desc ) VALUES( 'RES_POISON',               'Resists poison' );
INSERT INTO Flags( abbr, desc ) VALUES( 'RES_LIGHT',                'Resists light damage' );
INSERT INTO Flags( abbr, desc ) VALUES( 'RES_DARK',                 'Resists darkness damage' );
INSERT INTO Flags( abbr, desc ) VALUES( 'RES_BLIND',                'Resists blindness' );
INSERT INTO Flags( abbr, desc ) VALUES( 'HOLD_LIFE',                'Sustains experience' );
INSERT INTO Flags( abbr, desc ) VALUES( 'FREE_ACT',                 'Resists paralysis' );
INSERT INTO Flags( abbr, desc ) VALUES( 'REGEN',                    'Regenerates quickly' );
INSERT INTO Flags( abbr, desc ) VALUES( 'SEE_INVIS',                'Sees invisible creatures' );
INSERT INTO Flags( abbr, desc ) VALUES( 'EXTRA_SHOT',               'Gains extra shots with bow' );
INSERT INTO Flags( abbr, desc ) VALUES( 'BRAVERY_30',               'Gains immunity to fear' );
INSERT INTO Flags( abbr, desc ) VALUES( 'BLESS_WEAPON',             'Prefers blunt/blessed weapons' );
INSERT INTO Flags( abbr, desc, hidden ) VALUES( 'CUMBER_GLOVE',     'Have difficulty using magic with covered hands', 1 );
INSERT INTO Flags( abbr, desc ) VALUES( 'ZERO_FAIL',                'Advanced spellcasting' );
INSERT INTO Flags( abbr, desc, hidden ) VALUES( 'BEAM',             'Frequently turn bolt spells into beams', 1 );
INSERT INTO Flags( abbr, desc, hidden ) VALUES( 'CHOOSE_SPELLS',    'May choose their own spells to study', 1 );
INSERT INTO Flags( abbr, desc, hidden ) VALUES( 'PSEUDO_ID_IMPROV', 'Get better at pseudo id with experience', 1 );
INSERT INTO Flags( abbr, desc ) VALUES( 'KNOW_MUSHROOM',            'Identifies mushrooms' );
INSERT INTO Flags( abbr, desc ) VALUES( 'KNOW_ZAPPER',              'Identifies magic devices' );
INSERT INTO Flags( abbr, desc ) VALUES( 'SEE_ORE',                  'Senses ore/minerals' );

CREATE TABLE IF NOT EXISTS race2flag (
   race_id INTEGER,
   flag_id INTEGER,
   PRIMARY KEY( race_id, flag_id ),
   FOREIGN KEY( race_id ) REFERENCES theRace( id ),
   FOREIGN KEY( flag_id ) REFERENCES Flags( id )
);

INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'Half-Elf' AND f.abbr = 'SUST_DEX';
INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'Elf' AND f.abbr = 'SUST_DEX';
INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'Elf' AND f.abbr = 'RES_LIGHT';
INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'Hobbit' AND f.abbr = 'HOLD_LIFE';
INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'Hobbit' AND f.abbr = 'KNOW_MUSHROOM';
INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'Gnome' AND f.abbr = 'FREE_ACT';
INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'Gnome' AND f.abbr = 'KNOW_ZAPPER';
INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'Dwarf' AND f.abbr = 'RES_BLIND';
INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'Dwarf' AND f.abbr = 'SEE_ORE';
INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'Half-Orc' AND f.abbr = 'RES_DARK';
INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'Half-Troll' AND f.abbr = 'SUST_STR';
INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'Half-Troll' AND f.abbr = 'REGEN';
INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'Dunadan' AND f.abbr = 'RES_DARK';
INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'High-Elf' AND f.abbr = 'RES_LIGHT';
INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'High-Elf' AND f.abbr = 'SEE_INVIS';
INSERT INTO race2flag( race_id, flag_id ) SELECT r.id, f.id FROM theRace r, Flags f WHERE r.name = 'Kobold' AND f.abbr = 'RES_POISON';

CREATE TABLE IF NOT EXISTS class2flag (
   class_id INTEGER,
   flag_id  INTEGER,
   PRIMARY KEY( class_id, flag_id ),
   FOREIGN KEY( class_id ) REFERENCES theClass( id ),
   FOREIGN KEY( flag_id ) REFERENCES Flags( id )
);

INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Warrior' AND f.abbr = 'BRAVERY_30';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Warrior' AND f.abbr = 'PSEUDO_ID_IMPROV';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Mage' AND f.abbr = 'CUMBER_GLOVE';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Mage' AND f.abbr = 'ZERO_FAIL';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Mage' AND f.abbr = 'BEAM';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Mage' AND f.abbr = 'CHOOSE_SPELLS';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Priest' AND f.abbr = 'BLESS_WEAPON';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Priest' AND f.abbr = 'ZERO_FAIL';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Priest' AND f.abbr = 'PSEUDO_ID_IMPROV';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Rogue' AND f.abbr = 'CUMBER_GLOVE';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Rogue' AND f.abbr = 'CHOOSE_SPELLS';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Rogue' AND f.abbr = 'PSEUDO_ID_IMPROV';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Ranger' AND f.abbr = 'CUMBER_GLOVE';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Ranger' AND f.abbr = 'EXTRA_SHOT';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Ranger' AND f.abbr = 'CHOOSE_SPELLS';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Ranger' AND f.abbr = 'PSEUDO_ID_IMPROV';
INSERT INTO class2flag( class_id, flag_id ) SELECT c.id, f.id FROM theClass c, Flags f WHERE c.name = 'Paladin' AND f.abbr = 'PSEUDO_ID_IMPROV';

CREATE TABLE IF NOT EXISTS theCharacter (
   id      INTEGER PRIMARY KEY ASC AUTOINCREMENT,
   name    TEXT,
   sex     TEXT NOT NULL,
   race    INTEGER NOT NULL,
   class   INTEGER NOT NULL,
   updated DATETIME NOT NULL,
   dead    DATETIME,
   --
   FOREIGN KEY( race ) REFERENCES theRace( id ),
   FOREIGN KEY( class ) REFERENCES theClass( id )
);

