class Rooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |r|
      r.string :name, :limit => 100
    end
  end

  def self.down
    drop_table :rooms
  end
end