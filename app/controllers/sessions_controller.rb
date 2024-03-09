class SessionsController < ApplicationController
  def new
  end
  
  def create
    # TODO: authenticate user
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        # assign a cookie
        
        session["user_id"] = @user["id"]
  
        # login the user
        flash["notice"] = "You've logged in."
        redirect_to "/posts"
      else
        flash["notice"] = "Unsuccessful login."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Unsuccessful login."
      redirect_to "/login"
    end
  end

  def destroy 
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to "/login"
  end

end