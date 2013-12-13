PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS charProperties (
   name  TEXT,
   guiId INTEGER,
   type  TEXT,
   PRIMARY KEY( name ASC )
);

CREATE TABLE IF NOT EXISTS charFactors (
   property TEXT,
   name     TEXT,
   value    TEXT,
   FOREIGN KEY( property ) REFERENCES charProperties( name )
);

-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search
-- ) values ( 1, 'Human', 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 100, 0, 0, 0, 0, 0, 0, '+0/10');
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, sustains )
-- values ( 2, 'Half-Elf', 0, 1, 1, -1, -1, 1, -1, 5, 5, 10, 110, 2, 3, 3, 1, 20, 0, '+6/11', 'dexterity' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, sustains, resists )
-- values ( 3, 'Elf', -1, 1, 2, -2, -1, 1, -5, 15, 15, 9, 120, 5, 6, 6, 3, 30, 0, '+8/12', 'dexterity', 'light damage' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, sustains, extra )
-- values ( 4, 'Hobbit', -2, 3, 2, 2, 1, 1, -10, 20, 20, 7, 110, 15, 18, 18, 4, 40, 0, '+12/15', 'experience', 'Identifies mushrooms' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, resists, extra )
-- values ( 5, 'Gnome', -1, 2, 2, 1, 0, -2, -8, 12, 12, 8, 125, 10, 22, 12, 3, 40, 0, '+6/13', 'paralysis', 'Identifies magic devices' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, resists, extra )
-- values ( 6, 'Dwarf', 2, -2, -3, 2, 2, -3, 15, 0, 0, 11, 120, 2, 9, 9, -1, 50, 40, '+7/10', 'blindness', 'Senses ore/minerals' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, resists )
-- values ( 7, 'Half-Orc', 2, 0, -1, 1, 0, -4, 12, -5, -5, 10, 110, -3, -3, -3, -1, 30, 0, '+0/7', 'darkness damage' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, sustains, extra )
-- values ( 8, 'Half-Troll', 4, -4, -4, 3, -2, -6, 20, -10, -10, 12, 120, -5, -8, -8, -2, 30, 0, '-1/5', 'strength', 'Regenerates quickly' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, sustains )
-- values ( 9, 'Dunadan', 1, 2, 2, 3, 2, 2, 15, 10, 10, 10, 180, 4, 5, 5, 2, 0, 0, '+3/13', 'constitution' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, resists, extra )
-- values ( 10, 'High-Elf', 1, 3, 3, 1, -1, 5, 10, 25, 25, 10, 200, 4, 20, 20, 3, 40, 0, '+3/14', 'light damage', 'Sees invisible creatures' );
-- replace into race (
--   guiId, name, str, dex, int, con, wis, chr, hit, shoot, throw, hitDie, XPmod, disarm, devices, save, stealth, infravision, digging, search, resists )
-- values ( 11, 'Kobold', -1, 2, -1, 2, 0, -2, -5, 10, 10, 8, 115, 10, 5, 0, 4, 50, 0, '+15/15', 'poison' );
