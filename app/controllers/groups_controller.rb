class GroupsController < ApplicationController
  before_filter :require_login
  expose(:group, attributes: :group_params)
  expose(:groups, ancestor: :current_user)

  def create
    if group.save
      redirect_to group, notice: 'Group was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if group.save
      redirect_to group, notice: 'Group was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    group.destroy
    redirect_to groups_url, notice: 'Group was successfully destroyed.'
  end

  private
    def group_params
      params.require(:group).permit(:name)
    end
end
