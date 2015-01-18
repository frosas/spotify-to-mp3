module SpotifyToMp3
  class Spotify
    class Track
      attr_reader :artist, :name

      def initialize(artist, name)
        @artist = artist
        @name = name
      end
    end
  end
end
