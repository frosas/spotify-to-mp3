class SpotifyToMp3::Spotify::Track
  attr_reader :name, :artist

  def initialize(json)
    @name = json['track']['name']
    @artist = json['track']['artists'].first['name']
  end
end
