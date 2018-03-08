class UsersController < ApplicationController
# shows register form
  def new
    @user=User.new
  end

# post request to register new users
  def create
    @user=User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

# shows edit form
  def edit
    if @user = current_user
        if @user.id != params[:id].to_i
          redirect_to edit_user_path(@user)
        end
    else
      flash[:errors] = ["Stop trying to spy on someone else's private life you creepy fuck"]
      redirect_to login_path
    end
  end

# post request to update user's info
  def update

  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
