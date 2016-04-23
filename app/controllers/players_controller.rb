class PlayersController < ApplicationController
  def index
    @players = Player.all.sort {|a,b| a.name <=> b.name}
  end

  def show
    @player = Player.find_by(player_id: params[:player_id])
  end
end
