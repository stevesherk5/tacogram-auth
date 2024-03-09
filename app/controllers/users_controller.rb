class UsersController < ApplicationController
  def new
  end

  def create
    # TODO: insert conditional logic to only create a new user with a unique email 
    
    @user = User.new
    @user["first_name"] = params["first_name"]
    @user["last_name"] = params["last_name"]
    @user["email"] = params["email"]
    # TODO: encrypt user's password "at rest"
    @user["password"] = BCrypt::Password.create(params["password"])
    @user.save
    redirect_to "/posts"
  end
end
