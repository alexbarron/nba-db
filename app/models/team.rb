class Team < ActiveRecord::Base
  self.primary_key = 'team_id'
  has_many :players

  def self.get_all_teams
    @resp = Faraday.post 'http://api.probasketballapi.com/team' do |req|
      req.params['api_key'] = ENV["NBA_API"]
    end
    teams = JSON.parse(@resp.body)
    teams.each do |team|
      Team.find_or_create_by(team_id: team["id"], name: team["team_name"], city: team["city"], abbreviation: team["abbreviation"])
    end
  end

  def full_name
    self.city + " " + self.name
  end
end
