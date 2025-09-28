class CommunityController < ApplicationController
  def index
    @communities = Community.all().reverse

  end

  def create
    community = Community.create(name: params[:name])
    if community.save
      community.image.attach(params[:image])
      redirect_to request.referrer, notice: t('community_created_successfully'), allow_other_host: true
    end
  end
end
