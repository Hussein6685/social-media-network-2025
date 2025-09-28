class CommunityController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @communities = Community.all().reverse
  end

  def community
    @community = Community.find(params[:id])
  end
  def create
    community = Community.create(name: params[:name])
    if community.save
      community.image.attach(params[:image])
      redirect_to request.referrer, notice: t('community_created_successfully'), allow_other_host: true
    end
  end

  def join
    CommunityUser.create(user_id: current_user.id, community_id: params[:community_id])
    redirect_to request.referrer, notice: t('joined_community_successfully'), allow_other_host: true
  end

  def leave
    CommunityUser.where(user_id: current_user.id, community_id: params[:community_id]).destroy_all
    redirect_to request.referrer, notice: t('left_community_successfully'), allow_other_host: true
  end
end
