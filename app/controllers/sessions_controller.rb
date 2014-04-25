class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end


  def create
    @user = User.find_by_credentials(params[:user])
    if @user
      login!(@user)
      redirect_to user_url(@user.id)
    else
      flash.now[:errors] = "Invalid username and/or password"
      render :new
    end
  end


  def show

  end


  def destroy
    logout!
    redirect_to new_session_url
  end


  def edit

  end


end
