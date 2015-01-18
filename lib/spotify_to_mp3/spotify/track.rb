module SpotifyToMp3
  class Spotify
    class Track
      attr_reader :name, :artist

      def initialize(name, artist)
        @name = name
        @artist = artist
      end
    end
  end
end
