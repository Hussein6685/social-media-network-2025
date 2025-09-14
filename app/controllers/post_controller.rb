class PostController < ApplicationController
  def create
    post = Post.create(user_id: current_user.id, post_text: params[:post_text], has_image: false)
    if post.save
      post.image.attach(params[:image]) if params[:image].present?
      post.update(has_image: true) if params[:image].present?
      redirect_to request.referrer, notice: "تم إنشاء المنشور بنجاح.", allow_other_host: true
    end
  end
end
#   def create
#     # Logic for creating a new post
#     @post = Post.new(post_params)
#     if @post.save
#       redirect_to root_path, notice: 'Post was successfully created.'
#     else
#       render :new
#     end
#   end

#   private

#   def post_params
#     params.require(:post).permit(:content, :image)
#   end
# end

