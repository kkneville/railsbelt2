class MembershipsController < ApplicationController
  def index
  end

  def new
  end

  def create
    membership = Membership.new
    if session[:group_id]
      membership.group = Group.find(session[:group_id])
      session.delete(:group_id)
    else
      membership.group = Group.find(params[:group_id])
    end
    membership.user = current_user
    membership.save
    return redirect_to :back  
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
    memberships = Membership.all.where(user: current_user)
    membership = memberships.all.where(group: params[:group_id])[0]
    membership.delete
    return redirect_to :back
  end
end
