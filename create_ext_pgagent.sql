-- Create the pgAgent extension if it doesn't exist
DO $$
BEGIN
    -- Check if the pgAgent extension is already installed
    IF NOT EXISTS (
        SELECT 1 FROM pg_extension WHERE extname = 'pgagent'
    ) THEN
        CREATE EXTENSION pgagent;
    END IF;
END
$$;

-- Ensure the PL/pgSQL language is installed (it usually is by default)
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_language WHERE lanname = 'plpgsql'
    ) THEN
        CREATE LANGUAGE plpgsql;
    END IF;
END
$$;

