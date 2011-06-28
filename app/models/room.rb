class Room < ActiveRecord::Base

  has_many :messages
  belongs_to :user

  validates_presence_of :name
end
