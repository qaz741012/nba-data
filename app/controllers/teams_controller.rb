class TeamsController < ApplicationController
  def index
    @subareas = Subarea.all
    @subarea_id = params[:subarea_id]

    if @subarea_id
      @teams = Team.where(subarea_id: @subarea_id)
    else
      @teams = Team.all
    end
  end

  def show
    
  end
end