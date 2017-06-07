class MainController < ApplicationController
  before_action :current_user

  def index
    @posts = Post.all
  end


end
