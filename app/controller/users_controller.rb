class UsersController < ApplicationController
  attr_accessor :name, :email

  def show 
    @user = User.find(params[:id])
    
  end
  def new
    @user = User.new  
  end


  def create
    @user = User.new(user_params)
    if @user.save 
      log_in @user
      # puts @user.errors.full_messages
      flash[:success] = "welcome to the app"
      redirect_to user_url(@user)
      #handles a successful save
    else
      # flash.now[:danger] = 'invalid email/password combination'
      render 'new'
      

    end
    

  end

  def destroy 
    log_out
    redirect_to root_url
  end
  
  

  
   private 

   def user_params 
    params.require(:user).permit(:name,:email, :password, :password_confirmation)

   end
end
