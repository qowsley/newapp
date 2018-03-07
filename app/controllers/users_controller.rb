class UsersController < ApplicationRecord
# shows register form
  def new
    @user=User.new
  end

# post request to register new users
  def create
    @user=User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

# shows edit form
  def edit

  end

# post request to update user's info
  def update

  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
