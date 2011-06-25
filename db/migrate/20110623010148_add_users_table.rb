class AddUsersTable < ActiveRecord::Migration
  def self.up
    create_table :users do |u|
      u.string  :first_name,  :limit => 100
      u.string  :last_name,   :limit => 100
      u.string  :password,    :limit => 100
      u.string  :email,       :limit => 100
      u.trackable
      u.database_authenticatable
      u.rememberable
      u.token_authenticatable
      u.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
