class HomeController < ApplicationController
  def index
    @posts = []
    if current_user
      @posts = Post.where.not(user_id: current_user.id).order(created_at: :desc)
    end
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
end
