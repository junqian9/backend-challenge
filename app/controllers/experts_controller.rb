require 'expert_search_service'

class ExpertsController < ApplicationController
  def index
    @member = Member.find(params[:member_id])
    @matchings = []
    if (params[:search])
      @matchings = ExpertSearchService.find_user_matchings(@member, params[:search])
    end
  end
end
