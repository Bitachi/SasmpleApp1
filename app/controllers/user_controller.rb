class UserController < ApplicationController
  def new
    #debugger
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    #debugger
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #保存のせいこうしょり
      log_in @user
      flash[:success] = "Welcome to the Sample App1!"
      redirect_to @user
    else
      render action: :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

   def user_params
     params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
   end
end
