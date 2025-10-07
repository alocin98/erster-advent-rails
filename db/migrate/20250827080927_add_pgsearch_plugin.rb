class AddPgsearchPlugin < ActiveRecord::Migration[8.0]
   def change
    enable_extension "pg_trgm" unless extension_enabled?("pg_trgm")
    # helpful for ILIKE/trigram search on email
    add_index :users, :email, using: :gin, opclass: :gin_trgm_ops
    # tsvector index for full-text on email (simple config is fine for emails)
    execute <<~SQL
      CREATE INDEX IF NOT EXISTS users_search_idx
      ON users
      USING GIN (to_tsvector('simple', coalesce(email, '')));
    SQL
  end
end
