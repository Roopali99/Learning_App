class DropOauthApplications < ActiveRecord::Migration[6.1]
  def change
    drop_table :OauthApplications 
  end

end
