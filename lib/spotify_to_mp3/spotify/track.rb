module SpotifyToMp3
  class Spotify
    class Track
      attr_reader :name, :artist

      def initialize(json)
        @name = json['track']['name']
        @artist = json['track']['artists'].first['name']
      end
    end
  end
end
