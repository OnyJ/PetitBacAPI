class UsersController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  #before_action :isAuthenticated

  def show
     render json: current_user
  end

  def edit
  end

  def update
  end

  def index
    @users = User.all
  end

  def destroy
  end

  private
  def isAuthenticated
    if @user != current_user 
      return false
    end
  end

end
