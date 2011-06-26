class User < ActiveRecord::Base

  devise :database_authenticatable, :rememberable, :registerable, :trackable, :timeoutable, :validatable,
         :token_authenticatable

  attr_accessible :email, :password, :password_confirmation

  has_many :messages
    
end
