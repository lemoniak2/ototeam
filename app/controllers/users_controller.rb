class UsersController < ApplicationController
  expose(:user, attributes: :user_params)
  expose(:users)


  def edit
    if current_user != user
      #musi tak byc
    end
  end

  def create
    if user.save
      auto_login(user)
      redirect_to user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if user.save
      redirect_to user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
