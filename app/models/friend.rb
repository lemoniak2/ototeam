class Friend < ActiveRecord::Base
  belongs_to :user, foreign_key: :creator_id
  has_many :group_friends
  has_many :groups, through: :group_friends
  has_many :event_participants
  has_many :events, through: :event_participants
  validates :fullname, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, allow_blank: true
  validate :has_email_or_phone

  def group_names
    'Piłka, Bar'
  end

  def attendance_percentage
    '50%'
  end

  private

  def has_email_or_phone
    errors.add(:base, 'Please define email or phone') if email.blank? and phone.blank?
  end
end
