class GroupDecorator < ApplicationDecorator
  delegate_all

  def friends_names
    friends.map { |friend| friend.fullname}.join(', ')
  end

end
