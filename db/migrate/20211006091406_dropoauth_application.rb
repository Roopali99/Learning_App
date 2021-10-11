class DropoauthApplication < ActiveRecord::Migration[6.1]
  def up
    drop_table :oauth_applications
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
