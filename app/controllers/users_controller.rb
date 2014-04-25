class UsersController < ApplicationController


  def index
    render :index
  end


  def new
    render :new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      flash[:notice] = "Created user!"
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end


  def show

  end


  def destroy

  end


  def edit

  end


  private


  def user_params
    params.require(:user).permit(:email, :password)
  end


end
