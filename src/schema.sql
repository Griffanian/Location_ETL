CREATE TABLE IF NOT EXISTS suppliers (
  supplier_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  notes TEXT
);

CREATE TABLE IF NOT EXISTS branches (
  branch_id INTEGER PRIMARY KEY,                 
  supplier_id INTEGER NOT NULL REFERENCES suppliers(supplier_id),
  postcode TEXT NOT NULL, 
  notes TEXT
);

CREATE TABLE IF NOT EXISTS contacts (
    contact_id INTEGER PRIMARY KEY,
    branch_id INTEGER NOT NULL REFERENCES branches(branch_id),
    phone_number TEXT,
    email TEXT,
    name TEXT,
    notes TEXT,
    UNIQUE(branch_id, phone_number, email, name)
);

CREATE TABLE IF NOT EXISTS specialism_types (
    specialism_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    notes TEXT
);

CREATE TABLE IF NOT EXISTS branch_specialisms (
    branch_id INTEGER NOT NULL REFERENCES branches(branch_id) ON DELETE CASCADE,
    specialism_id INTEGER NOT NULL REFERENCES specialism_types(specialism_id) ON DELETE CASCADE,
    notes TEXT,
    PRIMARY KEY (branch_id, specialism_id),
    UNIQUE(branch_id, specialism_id)
);
