class TeamsController < ApplicationController

  def index
    @teams = Team.all.sort {|a,b| b.reg_wins.count <=> a.reg_wins.count}
  end

  def show
    @team = Team.find_by(team_id: params[:team_id])
  end
end
