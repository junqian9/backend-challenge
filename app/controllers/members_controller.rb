class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
    @headings = @member.headings.page(params[:page]).per(15)
    @other_members = Member.where.not(id: @member)
    @friends = Member.find(@member.friendships.pluck("friend_id"))
  end

  def create
    @member = Member.new(permitted_params)

    respond_to do |format|
      if @member.save
        schedule_related_jobs(@member.id, @member.website_url)
        format.html { redirect_to members_path }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def permitted_params
    params.require(:member).permit(:name, :website_url)
  end

  def schedule_related_jobs(id, website_url)
    MemberShortUrlJob.perform_now(id, website_url)
    MemberPullHeadingsJob.perform_now(id, website_url)
  end
end
