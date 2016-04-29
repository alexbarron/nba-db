class Game < ActiveRecord::Base
  self.primary_key = "game_id"
  belongs_to :home_team, foreign_key: :home_id, class_name: "Team"
  belongs_to :away_team, foreign_key: :away_id, class_name: "Team"

  def self.get_all_games
    @resp = Faraday.post 'http://api.probasketballapi.com/game' do |req|
      req.params['api_key'] = ENV["NBA_API"]
      req.params['season'] = "2015"
    end
    games = JSON.parse(@resp.body)
    games.each do |game|
      Game.find_or_create_by(game_id: game["id"], home_id: game["home_id"], away_id: game["away_id"], season: game["season"], date: game["date"])
    end
  end
end
