CREATE TABLE IF NOT EXISTS mercedes_inventory (
  vin             TEXT PRIMARY KEY,
  stock_number    TEXT,
  make            TEXT,
  model           TEXT,
  trim            TEXT,
  year            INTEGER,
  condition       TEXT,
  fuel_type       TEXT,
  exterior_color  TEXT,
  interior_color  TEXT,
  body_style      TEXT,
  msrp            TEXT,
  msrp_numeric    NUMERIC,
  title           TEXT,
  link            TEXT,
  synced_at       TIMESTAMPTZ DEFAULT NOW(),
  created_at      TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_mb_model     ON mercedes_inventory (model);
CREATE INDEX IF NOT EXISTS idx_mb_color     ON mercedes_inventory (exterior_color);
CREATE INDEX IF NOT EXISTS idx_mb_condition ON mercedes_inventory (condition);
CREATE INDEX IF NOT EXISTS idx_mb_fuel      ON mercedes_inventory (fuel_type);
CREATE INDEX IF NOT EXISTS idx_mb_price     ON mercedes_inventory (msrp_numeric);
