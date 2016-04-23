class Player < ActiveRecord::Base
  self.primary_key = 'player_id'
  belongs_to :team

  def self.get_all_players
    @resp = Faraday.post 'http://api.probasketballapi.com/player' do |req|
      req.params['api_key'] = ENV["NBA_API"]
    end
    players = JSON.parse(@resp.body)
    players.each do |player|
      Player.find_or_create_by(player_id: player["id"], name: player["player_name"], team_id: player["team_id"])
    end
  end
end
