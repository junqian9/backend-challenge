class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(permitted_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to members_path }
      else
        format.html {render action: 'new'}
      end
    end
  end

  private

  def permitted_params
    params.require(:member).permit(:name, :website_url)
  end
end
