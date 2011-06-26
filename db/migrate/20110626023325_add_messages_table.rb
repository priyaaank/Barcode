class AddMessagesTable < ActiveRecord::Migration
  def self.up
    create_table :messages do |m|
      m.string        :text, :limit => 255
      m.references    :user
      m.references    :room
      m.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
