class Rooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |r|
      r.string        :name, :limit => 100
      r.references    :user
      r.timestamps
    end
  end

  def self.down
    drop_table :rooms
  end
end
