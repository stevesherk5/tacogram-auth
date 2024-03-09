class PostsController < ApplicationController

    def index
      @posts = Post.all
      @users = User.all
    end
  
    def new
      if session["user_id"] 
      else
        flash["notice"] = "You need to log-in to post."
        redirect_to "/login"
      end
    end
  
    def create
      @post = Post.new
      @post["body"] = params["body"]
      @post["image"] = params["image"]
      # TODO: assign logged-in user as user that created the post
      @post["user_id"] = session["user_id"]
      @post.save
      redirect_to "/posts"
    end
  
  end
