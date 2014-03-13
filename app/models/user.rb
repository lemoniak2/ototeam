class User < ActiveRecord::Base
  has_many :events, foreign_key: :creator_id
  #has_many: :user_events
  has_many :groups, foreign_key: :creator_id
  has_many :friends, foreign_key: :creator_id
  authenticates_with_sorcery!
  validates_confirmation_of :password
  validates_presence_of [:email, :password, :name], on: :create
  validates_uniqueness_of :email
end
