PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS charProperties (
   name  TEXT,
   guiId INTEGER,
   type  TEXT,
   PRIMARY KEY( name ASC )
);

CREATE TABLE IF NOT EXISTS charFactors (
   property TEXT,
   factor   TEXT,
   value    TEXT,
   FOREIGN KEY( property ) REFERENCES charProperties( name )
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

INSERT INTO charFactors VALUES ( 'Half-Elf', 'Strength',        '+0' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Dexterity',       '+1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Intelligence',    '+1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Constitution',    '-1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Wisdom',          '-1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Charisma',        '+1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Hit',             '-1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Shoot',           '+5' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Throw',           '+5' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'HitDie',          '10' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'XPmod',         '110%' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Disarm',          '+2' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Devices',         '+3' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Save',            '+3' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Stealth',         '+1' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Infravision',  '20 ft' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Digging',         '+0' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Search',       '+6/11' );
INSERT INTO charFactors VALUES ( 'Half-Elf', 'Sustains', 'dexterity' );

INSERT INTO charFactors VALUES ( 'Elf', 'Strength',          '-1' );
INSERT INTO charFactors VALUES ( 'Elf', 'Dexterity',         '+1' );
INSERT INTO charFactors VALUES ( 'Elf', 'Intelligence',      '+2' );
INSERT INTO charFactors VALUES ( 'Elf', 'Constitution',      '-2' );
INSERT INTO charFactors VALUES ( 'Elf', 'Wisdom',            '-1' );
INSERT INTO charFactors VALUES ( 'Elf', 'Charisma',          '+1' );
INSERT INTO charFactors VALUES ( 'Elf', 'Hit',               '-5' );
INSERT INTO charFactors VALUES ( 'Elf', 'Shoot',            '+15' );
INSERT INTO charFactors VALUES ( 'Elf', 'Throw',            '+15' );
INSERT INTO charFactors VALUES ( 'Elf', 'HitDie',             '9' );
INSERT INTO charFactors VALUES ( 'Elf', 'XPmod',           '120%' );
INSERT INTO charFactors VALUES ( 'Elf', 'Disarm',            '+5' );
INSERT INTO charFactors VALUES ( 'Elf', 'Devices',           '+6' );
INSERT INTO charFactors VALUES ( 'Elf', 'Save',              '+6' );
INSERT INTO charFactors VALUES ( 'Elf', 'Stealth',           '+3' );
INSERT INTO charFactors VALUES ( 'Elf', 'Infravision',    '30 ft' );
INSERT INTO charFactors VALUES ( 'Elf', 'Digging',           '+0' );
INSERT INTO charFactors VALUES ( 'Elf', 'Search',         '+8/12' );
INSERT INTO charFactors VALUES ( 'Elf', 'Sustains',   'dexterity' );
INSERT INTO charFactors VALUES ( 'Elf', 'Resists', 'light damage' );

INSERT INTO charFactors VALUES ( 'Hobbit', 'Strength',          '-2' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Dexterity',         '+3' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Intelligence',      '+2' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Constitution',      '+2' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Wisdom',            '+1' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Charisma',          '+1' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Hit',              '-10' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Shoot',            '+20' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Throw',            '+20' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'HitDie',             '7' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'XPmod',           '110%' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Disarm',           '+15' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Devices',          '+18' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Save',             '+18' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Stealth',           '+4' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Infravision',    '40 ft' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Digging',           '+0' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Search',        '+12/15' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Sustains',  'experience' );
INSERT INTO charFactors VALUES ( 'Hobbit', 'Identifies', 'mushrooms' );

INSERT INTO charFactors VALUES ( 'Gnome', 'Strength',              '-1' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Dexterity',             '+2' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Intelligence',          '+2' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Constitution',          '+1' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Wisdom',                '+0' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Charisma',              '-2' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Hit',                   '-8' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Shoot',                '+12' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Throw',                '+12' );
INSERT INTO charFactors VALUES ( 'Gnome', 'HitDie',                 '8' );
INSERT INTO charFactors VALUES ( 'Gnome', 'XPmod',               '125%' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Disarm',               '+10' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Devices',              '+22' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Save',                 '+12' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Stealth',               '+3' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Infravision',        '40 ft' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Digging',               '+0' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Search',             '+6/13' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Resists',        'paralysis' );
INSERT INTO charFactors VALUES ( 'Gnome', 'Identifies', 'magic devices' );

INSERT INTO charFactors VALUES ( 'Dwarf', 'Strength',             '+2' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Dexterity',            '-2' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Intelligence',         '-3' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Constitution',         '+2' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Wisdom',               '+2' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Charisma',             '-3' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Hit',                 '+15' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Shoot',                '+0' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Throw',                '+0' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'HitDie',               '11' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'XPmod',              '120%' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Disarm',               '+2' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Devices',              '+9' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Save',                 '+9' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Stealth',              '-1' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Infravision',       '50 ft' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Digging',             '+40' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Search',            '+7/10' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Resists',       'blindness' );
INSERT INTO charFactors VALUES ( 'Dwarf', 'Identifies', 'ore/minerals' );

INSERT INTO charFactors VALUES ( 'Half-Orc', 'Strength',             '+2' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Dexterity',            '+0' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Intelligence',         '-1' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Constitution',         '+1' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Wisdom',               '+0' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Charisma',             '-4' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Hit',                 '+12' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Shoot',                '-5' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Throw',                '-5' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'HitDie',               '10' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'XPmod',              '110%' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Disarm',               '-3' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Devices',              '-3' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Save',                 '-3' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Stealth',              '-1' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Infravision',       '30 ft' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Digging',              '+0' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Search',             '+0/7' );
INSERT INTO charFactors VALUES ( 'Half-Orc', 'Resists', 'darkness damage' );

INSERT INTO charFactors VALUES ( 'Half-Troll', 'Strength',         '+4' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Dexterity',        '-4' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Intelligence',     '-4' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Constitution',     '+3' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Wisdom',           '-2' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Charisma',         '-6' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Hit',             '+20' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Shoot',           '-10' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Throw',           '-10' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'HitDie',           '12' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'XPmod',          '120%' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Disarm',           '-5' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Devices',          '-8' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Save',             '-8' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Stealth',          '-2' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Infravision',   '30 ft' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Digging',          '+0' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Search',         '-1/5' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Sustains',   'strength' );
INSERT INTO charFactors VALUES ( 'Half-Troll', 'Regenerates', 'quickly' );

INSERT INTO charFactors VALUES ( 'Dunadan', 'Strength',           '+1' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Dexterity',          '+2' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Intelligence',       '+2' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Constitution',       '+3' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Wisdom',             '+2' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Charisma',           '+2' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Hit',               '+15' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Shoot',             '+10' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Throw',             '+10' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'HitDie',             '10' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'XPmod',            '180%' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Disarm',             '+4' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Devices',            '+5' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Save',               '+5' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Stealth',            '+2' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Infravision',      '0 ft' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Digging',            '+0' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Search',          '+3/13' );
INSERT INTO charFactors VALUES ( 'Dunadan', 'Sustains', 'constitution' );

INSERT INTO charFactors VALUES ( 'High-Elf', 'Strength',              '+1' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Dexterity',             '+3' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Intelligence',          '+3' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Constitution',          '+1' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Wisdom',                '-1' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Charisma',              '+5' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Hit',                  '+10' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Shoot',                '+25' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Throw',                '+25' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'HitDie',                '10' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'XPmod',               '200%' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Disarm',                '+4' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Devices',              '+20' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Save',                 '+20' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Stealth',               '+3' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Infravision',        '40 ft' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Digging',               '+0' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Search',             '+3/14' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Resists',     'light damage' );
INSERT INTO charFactors VALUES ( 'High-Elf', 'Sees', 'invisible creatures' );

-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, resists )
-- values ( 11, 'Kobold', -1, 2, -1, 2, 0, -2, -5, 10, 10, 8, 115, 10, 5, 0, 4, 50, 0, '+15/15', 'poison' );
