class PostController < ApplicationController
  def create
    post = Post.create(user_id: current_user.id, post_text: params[:post_text], has_image: false)
    if post.save
      post.image.attach(params[:image]) if params[:image].present?
      post.update(has_image: true) if params[:image].present?
      redirect_to request.referrer, notice: "تم إنشاء المنشور بنجاح.", allow_other_host: true
    end
  end
  def like
    Like.create(user_id: current_user.id, post_id: params[:post_id])
    redirect_to request.referrer, notice: "تم الإعجاب بنجاح.", allow_other_host: true
  end
end
