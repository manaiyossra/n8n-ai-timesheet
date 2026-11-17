CREATE TABLE IF NOT EXISTS timesheet_entries (
  id              SERIAL PRIMARY KEY,
  project         TEXT         NOT NULL,
  entry_date      DATE         NOT NULL,
  description     TEXT         NOT NULL,
  estimated_hours NUMERIC(3,1) NOT NULL CHECK (estimated_hours > 0 AND estimated_hours <= 8),
  status          TEXT         NOT NULL DEFAULT 'proposed',
  week_start      DATE,
  week_end        DATE,
  created_at      TIMESTAMPTZ  NOT NULL DEFAULT now(),
  UNIQUE (project, entry_date)
);
