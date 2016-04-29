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

  def self.update_games
    @resp = Faraday.post 'http://api.probasketballapi.com/boxscore/team' do |req|
      req.params['api_key'] = ENV["NBA_API"]
      req.params['season'] = "2015"
    end
    boxscores = JSON.parse(@resp.body)

    boxscores.each do |boxscore|
      game = Game.find_by(game_id: boxscore["game_id"])
      if !game.nil?
        if game.home_id == boxscore["team_id"]
          game.home_score = boxscore["pts"]
        elsif game.away_id == boxscore["team_id"]
          game.away_score = boxscore["pts"]
        end
        game.save
      end
    end

    Game.all.each do |game|
      if game.home_score > game.away_score
        game.winner = game.home_id
        game.loser = game.away_id
      else
        game.winner = game.away_id
        game.loser = game.home_id
      end
      game.save
    end
  end
end
