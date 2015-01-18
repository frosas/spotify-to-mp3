module SpotifyToMp3
  class Spotify
    class Album
      attr_reader :artist, :name, :tracks

      def initialize(artist, name, tracks)
        @artist = artist
        @name = name
        @tracks = tracks
      end
    end
  end
end
