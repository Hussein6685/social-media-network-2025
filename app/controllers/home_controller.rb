class HomeController < ApplicationController
  def index
    @feeds = []
    if current_user
      posts = Post.where.not(user_id: current_user.id).order(created_at: :desc)
      comments = Comment.where.not(user_id: current_user.id).order(created_at: :desc)
      all_add_activities = posts + comments
      @feeds = all_add_activities.sort_by(&:created_at).reverse
    end
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
end
