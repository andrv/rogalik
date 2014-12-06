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

CREATE TABLE IF NOT EXISTS charProperties (
   name  TEXT,
   guiId INTEGER NOT NULL,
   type  TEXT NOT NULL,
   PRIMARY KEY( name ASC )
);

CREATE TABLE IF NOT EXISTS charFactors (
   property TEXT,
   factor   TEXT,
   value    TEXT NOT NULL,
   PRIMARY KEY( property, factor ),
   FOREIGN KEY( property ) REFERENCES charProperties( name )
);

CREATE TABLE IF NOT EXISTS theCharacter (
   id      INTEGER,
   name    TEXT,
   sex     TEXT NOT NULL,
   race    TEXT NOT NULL,
   class   TEXT NOT NULL,
   updated DATETIME NOT NULL,
   dead    DATETIME,
   PRIMARY KEY( id ASC ),
   FOREIGN KEY( race )  REFERENCES charProperties( name ),
   FOREIGN KEY( class ) REFERENCES charProperties( name )
);

INSERT INTO charProperties VALUES ( 'Human',      1, 'race' );
INSERT INTO charProperties VALUES ( 'Half-Elf',   2, 'race' );
INSERT INTO charProperties VALUES ( 'Elf',        3, 'race' );
INSERT INTO charProperties VALUES ( 'Hobbit',     4, 'race' );
INSERT INTO charProperties VALUES ( 'Gnome',      5, 'race' );
INSERT INTO charProperties VALUES ( 'Dwarf',      6, 'race' );
INSERT INTO charProperties VALUES ( 'Half-Orc',   7, 'race' );
INSERT INTO charProperties VALUES ( 'Half-Troll', 8, 'race' );
INSERT INTO charProperties VALUES ( 'Dunadan',    9, 'race' );
INSERT INTO charProperties VALUES ( 'High-Elf',  10, 'race' );
INSERT INTO charProperties VALUES ( 'Kobold',    11, 'race' );

INSERT INTO charProperties VALUES ( 'Warrior',    1, 'class' );
INSERT INTO charProperties VALUES ( 'Mage',       2, 'class' );
INSERT INTO charProperties VALUES ( 'Priest',     3, 'class' );
INSERT INTO charProperties VALUES ( 'Rogue',      4, 'class' );
INSERT INTO charProperties VALUES ( 'Ranger',     5, 'class' );
INSERT INTO charProperties VALUES ( 'Paladin',    6, 'class' );

INSERT INTO charFactors VALUES ( 'Human', 'Strength',      '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Dexterity',     '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Intelligence',  '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Constitution',  '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Wisdom',        '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Charisma',      '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Hit',           '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Shoot',         '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Throw',         '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'HitDie',        '10' );
INSERT INTO charFactors VALUES ( 'Human', 'XPmod',       '100%' );
INSERT INTO charFactors VALUES ( 'Human', 'Disarm',        '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Devices',       '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Save',          '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Stealth',       '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Infravision', '0 ft' );
INSERT INTO charFactors VALUES ( 'Human', 'Digging',       '+0' );
INSERT INTO charFactors VALUES ( 'Human', 'Search',     '+0/10' );

INSERT INTO charFactors VALUES ( 'Half-Elf', 'Strength',               '+0' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Dexterity',              '+1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Intelligence',           '+1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Constitution',           '-1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Wisdom',                 '-1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Charisma',               '+1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Hit',                    '-1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Shoot',                  '+5' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Throw',                  '+5' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'HitDie',                 '10' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'XPmod',                '110%' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Disarm',                 '+2' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Devices',                '+3' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Save',                   '+3' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Stealth',                '+1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Infravision',         '20 ft' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Digging',                '+0' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Search',              '+6/11' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'bonus1', 'Sustains dexterity' );

INSERT INTO charFactors VALUES ( 'Elf', 'Strength',                 '-1' );
INSERT INTO charFactors VALUES ( 'Elf', 'Dexterity',                '+1' );
INSERT INTO charFactors VALUES ( 'Elf', 'Intelligence',             '+2' );
INSERT INTO charFactors VALUES ( 'Elf', 'Constitution',             '-2' );
INSERT INTO charFactors VALUES ( 'Elf', 'Wisdom',                   '-1' );
INSERT INTO charFactors VALUES ( 'Elf', 'Charisma',                 '+1' );
INSERT INTO charFactors VALUES ( 'Elf', 'Hit',                      '-5' );
INSERT INTO charFactors VALUES ( 'Elf', 'Shoot',                   '+15' );
INSERT INTO charFactors VALUES ( 'Elf', 'Throw',                   '+15' );
INSERT INTO charFactors VALUES ( 'Elf', 'HitDie',                    '9' );
INSERT INTO charFactors VALUES ( 'Elf', 'XPmod',                  '120%' );
INSERT INTO charFactors VALUES ( 'Elf', 'Disarm',                   '+5' );
INSERT INTO charFactors VALUES ( 'Elf', 'Devices',                  '+6' );
INSERT INTO charFactors VALUES ( 'Elf', 'Save',                     '+6' );
INSERT INTO charFactors VALUES ( 'Elf', 'Stealth',                  '+3' );
INSERT INTO charFactors VALUES ( 'Elf', 'Infravision',           '30 ft' );
INSERT INTO charFactors VALUES ( 'Elf', 'Digging',                  '+0' );
INSERT INTO charFactors VALUES ( 'Elf', 'Search',                '+8/12' );
INSERT INTO charFactors VALUES ( 'Elf', 'bonus1',   'Sustains dexterity' );
INSERT INTO charFactors VALUES ( 'Elf', 'bonus2', 'Resists light damage' );

INSERT INTO charFactors VALUES ( 'Hobbit', 'Strength',                 '-2' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Dexterity',                '+3' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Intelligence',             '+2' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Constitution',             '+2' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Wisdom',                   '+1' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Charisma',                 '+1' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Hit',                     '-10' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Shoot',                   '+20' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Throw',                   '+20' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'HitDie',                    '7' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'XPmod',                  '110%' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Disarm',                  '+15' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Devices',                 '+18' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Save',                    '+18' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Stealth',                  '+4' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Infravision',           '40 ft' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Digging',                  '+0' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Search',               '+12/15' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'bonus1',  'Sustains experience' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'bonus2', 'Identifies mushrooms' );

INSERT INTO charFactors VALUES ( 'Gnome', 'Strength',                     '-1' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Dexterity',                    '+2' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Intelligence',                 '+2' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Constitution',                 '+1' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Wisdom',                       '+0' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Charisma',                     '-2' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Hit',                          '-8' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Shoot',                       '+12' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Throw',                       '+12' );
INSERT INTO charFactors VALUES ( 'Gnome', 'HitDie',                        '8' );
INSERT INTO charFactors VALUES ( 'Gnome', 'XPmod',                      '125%' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Disarm',                      '+10' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Devices',                     '+22' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Save',                        '+12' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Stealth',                      '+3' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Infravision',               '40 ft' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Digging',                      '+0' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Search',                    '+6/13' );
INSERT INTO charFactors VALUES ( 'Gnome', 'bonus1',        'Resists paralysis' );
INSERT INTO charFactors VALUES ( 'Gnome', 'bonus2', 'Identifies magic devices' );

INSERT INTO charFactors VALUES ( 'Dwarf', 'Strength',                    '+2' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Dexterity',                   '-2' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Intelligence',                '-3' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Constitution',                '+2' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Wisdom',                      '+2' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Charisma',                    '-3' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Hit',                        '+15' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Shoot',                       '+0' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Throw',                       '+0' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'HitDie',                      '11' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'XPmod',                     '120%' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Disarm',                      '+2' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Devices',                     '+9' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Save',                        '+9' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Stealth',                     '-1' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Infravision',              '50 ft' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Digging',                    '+40' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Search',                   '+7/10' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'bonus1',       'Resists blindness' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'bonus2', 'Identifies ore/minerals' );

INSERT INTO charFactors VALUES ( 'Half-Orc', 'Strength',                    '+2' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Dexterity',                   '+0' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Intelligence',                '-1' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Constitution',                '+1' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Wisdom',                      '+0' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Charisma',                    '-4' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Hit',                        '+12' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Shoot',                       '-5' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Throw',                       '-5' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'HitDie',                      '10' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'XPmod',                     '110%' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Disarm',                      '-3' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Devices',                     '-3' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Save',                        '-3' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Stealth',                     '-1' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Infravision',              '30 ft' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Digging',                     '+0' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Search',                    '+0/7' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'bonus1', 'Resists darkness damage' );

INSERT INTO charFactors VALUES ( 'Half-Troll', 'Strength',                '+4' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Dexterity',               '-4' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Intelligence',            '-4' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Constitution',            '+3' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Wisdom',                  '-2' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Charisma',                '-6' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Hit',                    '+20' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Shoot',                  '-10' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Throw',                  '-10' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'HitDie',                  '12' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'XPmod',                 '120%' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Disarm',                  '-5' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Devices',                 '-8' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Save',                    '-8' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Stealth',                 '-2' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Infravision',          '30 ft' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Digging',                 '+0' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Search',                '-1/5' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'bonus1',   'Sustains strength' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'bonus2', 'Regenerates quickly' );

INSERT INTO charFactors VALUES ( 'Dunadan', 'Strength',                  '+1' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Dexterity',                 '+2' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Intelligence',              '+2' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Constitution',              '+3' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Wisdom',                    '+2' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Charisma',                  '+2' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Hit',                      '+15' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Shoot',                    '+10' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Throw',                    '+10' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'HitDie',                    '10' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'XPmod',                   '180%' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Disarm',                    '+4' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Devices',                   '+5' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Save',                      '+5' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Stealth',                   '+2' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Infravision',             '0 ft' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Digging',                   '+0' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Search',                 '+3/13' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'bonus1', 'Sustains constitution' );

INSERT INTO charFactors VALUES ( 'High-Elf', 'Strength',                     '+1' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Dexterity',                    '+3' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Intelligence',                 '+3' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Constitution',                 '+1' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Wisdom',                       '-1' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Charisma',                     '+5' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Hit',                         '+10' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Shoot',                       '+25' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Throw',                       '+25' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'HitDie',                       '10' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'XPmod',                      '200%' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Disarm',                       '+4' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Devices',                     '+20' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Save',                        '+20' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Stealth',                      '+3' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Infravision',               '40 ft' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Digging',                      '+0' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Search',                    '+3/14' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'bonus1',     'Resists light damage' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'bonus2', 'Sees invisible creatures' );

INSERT INTO charFactors VALUES ( 'Kobold', 'Strength',           '-1' );
INSERT INTO charFactors VALUES ( 'Kobold', 'Dexterity',          '+2' );
INSERT INTO charFactors VALUES ( 'Kobold', 'Intelligence',       '-1' );
INSERT INTO charFactors VALUES ( 'Kobold', 'Constitution',       '+2' );
INSERT INTO charFactors VALUES ( 'Kobold', 'Wisdom',             '+0' );
INSERT INTO charFactors VALUES ( 'Kobold', 'Charisma',           '-2' );
INSERT INTO charFactors VALUES ( 'Kobold', 'Hit',                '-5' );
INSERT INTO charFactors VALUES ( 'Kobold', 'Shoot',             '+10' );
INSERT INTO charFactors VALUES ( 'Kobold', 'Throw',             '+10' );
INSERT INTO charFactors VALUES ( 'Kobold', 'HitDie',              '8' );
INSERT INTO charFactors VALUES ( 'Kobold', 'XPmod',            '115%' );
INSERT INTO charFactors VALUES ( 'Kobold', 'Disarm',            '+10' );
INSERT INTO charFactors VALUES ( 'Kobold', 'Devices',            '+5' );
INSERT INTO charFactors VALUES ( 'Kobold', 'Save',               '+0' );
INSERT INTO charFactors VALUES ( 'Kobold', 'Stealth',            '+4' );
INSERT INTO charFactors VALUES ( 'Kobold', 'Infravision',     '50 ft' );
INSERT INTO charFactors VALUES ( 'Kobold', 'Digging',            '+0' );
INSERT INTO charFactors VALUES ( 'Kobold', 'Search',         '+15/15' );
INSERT INTO charFactors VALUES ( 'Kobold', 'bonus1', 'Resists poison' );

INSERT INTO charFactors VALUES ( 'Warrior', 'Strength',                   '+5' );
INSERT INTO charFactors VALUES ( 'Warrior', 'Dexterity',                  '+2' );
INSERT INTO charFactors VALUES ( 'Warrior', 'Intelligence',               '-2' );
INSERT INTO charFactors VALUES ( 'Warrior', 'Constitution',               '+2' );
INSERT INTO charFactors VALUES ( 'Warrior', 'Wisdom',                     '-2' );
INSERT INTO charFactors VALUES ( 'Warrior', 'Charisma',                   '-1' );
INSERT INTO charFactors VALUES ( 'Warrior', 'Hit',                       '+70' );
INSERT INTO charFactors VALUES ( 'Warrior', 'Shoot',                     '+55' );
INSERT INTO charFactors VALUES ( 'Warrior', 'Throw',                     '+55' );
INSERT INTO charFactors VALUES ( 'Warrior', 'HitDie',                      '9' );
INSERT INTO charFactors VALUES ( 'Warrior', 'XPmod',                      '0%' );
INSERT INTO charFactors VALUES ( 'Warrior', 'Disarm',                    '+25' );
INSERT INTO charFactors VALUES ( 'Warrior', 'Devices',                   '+18' );
INSERT INTO charFactors VALUES ( 'Warrior', 'Save',                      '+18' );
INSERT INTO charFactors VALUES ( 'Warrior', 'Stealth',                    '+1' );
INSERT INTO charFactors VALUES ( 'Warrior', 'Digging',                    '+0' );
INSERT INTO charFactors VALUES ( 'Warrior', 'Search',                  '+14/2' );
INSERT INTO charFactors VALUES ( 'Warrior', 'bonus1', 'Gains immunity to fear' );

INSERT INTO charFactors VALUES ( 'Mage', 'Strength',                  '-5' );
INSERT INTO charFactors VALUES ( 'Mage', 'Dexterity',                 '+1' );
INSERT INTO charFactors VALUES ( 'Mage', 'Intelligence',              '+3' );
INSERT INTO charFactors VALUES ( 'Mage', 'Constitution',              '-2' );
INSERT INTO charFactors VALUES ( 'Mage', 'Wisdom',                    '+0' );
INSERT INTO charFactors VALUES ( 'Mage', 'Charisma',                  '+1' );
INSERT INTO charFactors VALUES ( 'Mage', 'Hit',                      '+34' );
INSERT INTO charFactors VALUES ( 'Mage', 'Shoot',                    '+20' );
INSERT INTO charFactors VALUES ( 'Mage', 'Throw',                    '+20' );
INSERT INTO charFactors VALUES ( 'Mage', 'HitDie',                     '0' );
INSERT INTO charFactors VALUES ( 'Mage', 'XPmod',                    '30%' );
INSERT INTO charFactors VALUES ( 'Mage', 'Disarm',                   '+30' );
INSERT INTO charFactors VALUES ( 'Mage', 'Devices',                  '+36' );
INSERT INTO charFactors VALUES ( 'Mage', 'Save',                     '+30' );
INSERT INTO charFactors VALUES ( 'Mage', 'Stealth',                   '+2' );
INSERT INTO charFactors VALUES ( 'Mage', 'Digging',                   '+0' );
INSERT INTO charFactors VALUES ( 'Mage', 'Search',                '+16/20' );
INSERT INTO charFactors VALUES ( 'Mage', 'bonus1',   'Learns arcane magic' );
INSERT INTO charFactors VALUES ( 'Mage', 'bonus2', 'Advanced spellcasting' );

INSERT INTO charFactors VALUES ( 'Priest', 'Strength',                          '-1' );
INSERT INTO charFactors VALUES ( 'Priest', 'Dexterity',                         '-1' );
INSERT INTO charFactors VALUES ( 'Priest', 'Intelligence',                      '-3' );
INSERT INTO charFactors VALUES ( 'Priest', 'Constitution',                      '+0' );
INSERT INTO charFactors VALUES ( 'Priest', 'Wisdom',                            '+3' );
INSERT INTO charFactors VALUES ( 'Priest', 'Charisma',                          '+2' );
INSERT INTO charFactors VALUES ( 'Priest', 'Hit',                              '+48' );
INSERT INTO charFactors VALUES ( 'Priest', 'Shoot',                            '+35' );
INSERT INTO charFactors VALUES ( 'Priest', 'Throw',                            '+35' );
INSERT INTO charFactors VALUES ( 'Priest', 'HitDie',                             '2' );
INSERT INTO charFactors VALUES ( 'Priest', 'XPmod',                            '20%' );
INSERT INTO charFactors VALUES ( 'Priest', 'Disarm',                           '+25' );
INSERT INTO charFactors VALUES ( 'Priest', 'Devices',                          '+30' );
INSERT INTO charFactors VALUES ( 'Priest', 'Save',                             '+32' );
INSERT INTO charFactors VALUES ( 'Priest', 'Stealth',                           '+2' );
INSERT INTO charFactors VALUES ( 'Priest', 'Digging',                           '+0' );
INSERT INTO charFactors VALUES ( 'Priest', 'Search',                         '+16/8' );
INSERT INTO charFactors VALUES ( 'Priest', 'bonus1',           'Learns divine magic' );
INSERT INTO charFactors VALUES ( 'Priest', 'bonus2', 'Prefers blunt/blessed weapons' );
INSERT INTO charFactors VALUES ( 'Priest', 'bonus3',         'Advanced spellcasting' );

INSERT INTO charFactors VALUES ( 'Rogue', 'Strength',                '+2' );
INSERT INTO charFactors VALUES ( 'Rogue', 'Dexterity',               '+3' );
INSERT INTO charFactors VALUES ( 'Rogue', 'Intelligence',            '+1' );
INSERT INTO charFactors VALUES ( 'Rogue', 'Constitution',            '+1' );
INSERT INTO charFactors VALUES ( 'Rogue', 'Wisdom',                  '-2' );
INSERT INTO charFactors VALUES ( 'Rogue', 'Charisma',                '-1' );
INSERT INTO charFactors VALUES ( 'Rogue', 'Hit',                    '+60' );
INSERT INTO charFactors VALUES ( 'Rogue', 'Shoot',                  '+66' );
INSERT INTO charFactors VALUES ( 'Rogue', 'Throw',                  '+66' );
INSERT INTO charFactors VALUES ( 'Rogue', 'HitDie',                   '6' );
INSERT INTO charFactors VALUES ( 'Rogue', 'XPmod',                  '25%' );
INSERT INTO charFactors VALUES ( 'Rogue', 'Disarm',                 '+45' );
INSERT INTO charFactors VALUES ( 'Rogue', 'Devices',                '+32' );
INSERT INTO charFactors VALUES ( 'Rogue', 'Save',                   '+28' );
INSERT INTO charFactors VALUES ( 'Rogue', 'Stealth',                 '+5' );
INSERT INTO charFactors VALUES ( 'Rogue', 'Digging',                 '+0' );
INSERT INTO charFactors VALUES ( 'Rogue', 'Search',              '+32/24' );
INSERT INTO charFactors VALUES ( 'Rogue', 'bonus1', 'Learns arcane magic' );

INSERT INTO charFactors VALUES ( 'Ranger', 'Strength',                       '+2' );
INSERT INTO charFactors VALUES ( 'Ranger', 'Dexterity',                      '+1' );
INSERT INTO charFactors VALUES ( 'Ranger', 'Intelligence',                   '+2' );
INSERT INTO charFactors VALUES ( 'Ranger', 'Constitution',                   '+1' );
INSERT INTO charFactors VALUES ( 'Ranger', 'Wisdom',                         '+0' );
INSERT INTO charFactors VALUES ( 'Ranger', 'Charisma',                       '+1' );
INSERT INTO charFactors VALUES ( 'Ranger', 'Hit',                           '+56' );
INSERT INTO charFactors VALUES ( 'Ranger', 'Shoot',                         '+72' );
INSERT INTO charFactors VALUES ( 'Ranger', 'Throw',                         '+72' );
INSERT INTO charFactors VALUES ( 'Ranger', 'HitDie',                          '4' );
INSERT INTO charFactors VALUES ( 'Ranger', 'XPmod',                         '30%' );
INSERT INTO charFactors VALUES ( 'Ranger', 'Disarm',                        '+30' );
INSERT INTO charFactors VALUES ( 'Ranger', 'Devices',                       '+32' );
INSERT INTO charFactors VALUES ( 'Ranger', 'Save',                          '+28' );
INSERT INTO charFactors VALUES ( 'Ranger', 'Stealth',                        '+3' );
INSERT INTO charFactors VALUES ( 'Ranger', 'Digging',                        '+0' );
INSERT INTO charFactors VALUES ( 'Ranger', 'Search',                     '+24/16' );
INSERT INTO charFactors VALUES ( 'Ranger', 'bonus1',        'Learns arcane magic' );
INSERT INTO charFactors VALUES ( 'Ranger', 'bonus2', 'Gains extra shots with bow' );

INSERT INTO charFactors VALUES ( 'Paladin', 'Strength',                '+3' );
INSERT INTO charFactors VALUES ( 'Paladin', 'Dexterity',               '+0' );
INSERT INTO charFactors VALUES ( 'Paladin', 'Intelligence',            '-3' );
INSERT INTO charFactors VALUES ( 'Paladin', 'Constitution',            '+0' );
INSERT INTO charFactors VALUES ( 'Paladin', 'Wisdom',                  '+3' );
INSERT INTO charFactors VALUES ( 'Paladin', 'Charisma',                '+2' );
INSERT INTO charFactors VALUES ( 'Paladin', 'Hit',                    '+68' );
INSERT INTO charFactors VALUES ( 'Paladin', 'Shoot',                  '+40' );
INSERT INTO charFactors VALUES ( 'Paladin', 'Throw',                  '+40' );
INSERT INTO charFactors VALUES ( 'Paladin', 'HitDie',                   '6' );
INSERT INTO charFactors VALUES ( 'Paladin', 'XPmod',                  '35%' );
INSERT INTO charFactors VALUES ( 'Paladin', 'Disarm',                 '+20' );
INSERT INTO charFactors VALUES ( 'Paladin', 'Devices',                '+24' );
INSERT INTO charFactors VALUES ( 'Paladin', 'Save',                   '+25' );
INSERT INTO charFactors VALUES ( 'Paladin', 'Stealth',                 '+1' );
INSERT INTO charFactors VALUES ( 'Paladin', 'Digging',                 '+0' );
INSERT INTO charFactors VALUES ( 'Paladin', 'Search',               '+12/2' );
INSERT INTO charFactors VALUES ( 'Paladin', 'bonus1', 'Learns divine magic' );
