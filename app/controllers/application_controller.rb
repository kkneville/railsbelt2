class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def members_count(group)
  	group = Group.find(group)
  	members = group.users
  	members = members.select(:id).map(&:id).uniq
  	members_count = members.length
  end 

  helper_method :members_count

end
