class TeamsController < ApplicationController
  respond_to :html, :js, only: :index

  def index
    @subareas = Subarea.all
    @subarea_id = params[:subarea_id] || "all"

    if @subarea_id != "all"
      @teams = Team.where(subarea_id: @subarea_id)
    else
      @teams = Team.all
    end
  end

  def show
    @team = Team.find(params[:id])

    @players = @team.players
    @order_method = "desc"
    @players = @players.order(params[:order] => @order_method) if params[:order]
  end
end