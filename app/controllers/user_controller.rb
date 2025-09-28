class UserController < ApplicationController
  def index
    @users = User.all
  end

  def profile
    @user = current_user
  end

  def avatar
    user = User.find(current_user.id)
    user.avatar.attach(params[:avatar])
    redirect_to request.referrer, notice: 'تم تحديث صورة الملف الشخصي بنجاح.', allow_other_host: true
  end
end
