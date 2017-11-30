class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]
  before_action :auth, except: [:create]

  def create
    user = User.new(user_params)
    if user.save
      redirect_to sessions_path
    else
      flash[:notice] = ["Can't be blank"]
      redirect_to sessions_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    user = User.update(params[:id], update_params)
    if user.valid?
      redirect_to events_path
    else
      flash[:notice] = user.errors.full_messages
      redirect_to users_edit_path
    end
  end

  private
    def user_params
      params.require(:register).permit(:first_name, :last_name, :email, :city, :state, :password)
    end

    def update_params
      params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password)
    end

    def auth
      return redirect_to events_path unless current_user.id == params[:id].to_i
    end
end
