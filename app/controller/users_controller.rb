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
      # puts @user.errors.full_messages
      flash[:success] = "welcome to the app"
      redirect_to user_url(@user)
      #handles a successful save
    else
      render 'new'

    end
    

  end
  
  

  
   private 

   def user_params 
    params.require(:user).permit(:name,:email, :password, :password_confirmation)

   end
end
