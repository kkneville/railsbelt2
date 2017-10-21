class GroupsController < ApplicationController
  
  def index
    @groups = Group.all
  end

  def new
  end

  def create
    group = Group.new(group_params)
    if group.valid?
      group.save
      session[:group_id] = group.id
      return redirect_to add_first_member_path
    end
    flash[:errors] = group.errors.full_messages    
    return redirect_to :back
  end

  def show
    @group = Group.find(params[:group_id])
    @members = @group.users
  end

  def edit
  end

  def update
  end

  def delete
    group = Group.find(params[:group_id])
    group.destroy
    return redirect_to index_path
  end

  private
    def group_params
      params.require(:group).permit(:name, :desc).merge(user: current_user)
    end 

end
