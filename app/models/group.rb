class Group < ActiveRecord::Base
  belongs_to :user, foreign_key: :creator_id
  has_many :group_friends
  has_many :friends, through: :group_friends
  validates :name, presence: true
  def friends_count
    0
  end
end
