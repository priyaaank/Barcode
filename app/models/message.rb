class Message < ActiveRecord::Base

  belongs_to :user
  belongs_to :room

  validates_presence_of :user
  validates_presence_of :room

  scope :all_messages_after, lambda { |date| where("created_at >= ?", date ) }
  scope :all_messages_from, lambda { |id| where("id > ?", id ) }
end
