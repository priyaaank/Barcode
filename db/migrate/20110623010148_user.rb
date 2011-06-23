class User < ActiveRecord::Migration
  def self.up
    create_table :users do |u|
      u.string  :first_name,  :limit => 100
      u.string  :last_name,   :limit => 100
      u.string  :username,    :limit => 100
      u.string  :password,    :limit => 100
      u.string  :email,       :limit => 100
    end
  end

  def self.down
    drop_table :users
  end
end
