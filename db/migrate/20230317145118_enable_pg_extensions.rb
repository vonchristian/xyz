class EnablePgExtensions < ActiveRecord::Migration[7.0]
  def up
    enable_extension('pg_trgm')
    enable_extension('fuzzystrmatch')
    say_with_time("Adding support functions for pg_search :dmetaphone") do
      execute <<~'SQL'.squish
        CREATE OR REPLACE FUNCTION pg_search_dmetaphone(text) RETURNS text LANGUAGE SQL IMMUTABLE STRICT AS $function$
          SELECT array_to_string(ARRAY(SELECT dmetaphone(unnest(regexp_split_to_array($1, E'\\s+')))), ' ')
        $function$;
      SQL
    end
  end

  def down
    disable_extension('fuzzystrmatch')
    disable_extension('pg_trgm')

    say_with_time("Dropping support functions for pg_search :dmetaphone") do
      execute <<~'SQL'.squish
        DROP FUNCTION pg_search_dmetaphone(text);
      SQL
    end
  end
end
