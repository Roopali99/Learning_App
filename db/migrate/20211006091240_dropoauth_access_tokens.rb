class DropoauthAccessTokens < ActiveRecord::Migration[6.1]
  def up
    drop_table :oauth_access_tokens
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
