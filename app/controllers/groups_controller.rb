class GroupsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show]
  
  def show
    @group = Group.find(params[:id])
  end
 
  def edit
    @group = Group.find(params[:id])
  end
 
  def update
    @group = Group.find(params[:id])
    @group.update(update_params)
  end
 
  private
  def update_params
    params.require(:group).permit(:key, :detail)
  end
end
