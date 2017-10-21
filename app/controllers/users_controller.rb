class UsersController < ApplicationController
  def index
  end

  def new
    if current_user
      return redirect_to index_path
    end  
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id]= user.id
      return redirect_to index_path
    end
    flash[:errors] = user.errors.full_messages    
    return redirect_to :back
  end

  def show
    @user = User.find(params[:user_id])
    return render "/users/show.html.erb"
  end

  def edit
  end

  def update
    user = update_user(user_params)
    if user.valid?
      user.save
      return redirect_to user_path
    end  
    return redirect_to index_path
  end

  def delete
  end

  private
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end 

    def update_user(params)
    user = User.find(current_user.id)
    user.firstname = params[:firstname]
    user.lastname = params[:lastname]
    user.email = params[:email]
    user.save
    return user
    end 
end
