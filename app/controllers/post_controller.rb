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
  def comment
    Comment.create(user_id: current_user.id, post_id: params[:post_id], comment_text: params[:comment_text])
    redirect_to request.referrer, notice: "تم إضافة التعليق بنجاح.", allow_other_host: true
  end
  def repost
    Repost.create(user_id: current_user.id, post_id: params[:post_id])
    redirect_to request.referrer, notice: "تم إعادة نشر المنشور بنجاح.", allow_other_host: true
  end
end
