class FriendsController < ApplicationController
  before_filter :require_login
  expose(:friend, attributes: :friend_params)
  expose(:friends, ancestor: :current_user)

  def create
    if friend.save
      redirect_to friend, notice: 'Friend was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if friend.save
      redirect_to friend, notice: 'Friend was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    friend.destroy
    redirect_to friends_url, notice: 'Friend was successfully destroyed.'
  end

  private
    def friend_params
      params.require(:friend).permit(:fullname, :email, :phone,  {group_ids: []})
    end
end
