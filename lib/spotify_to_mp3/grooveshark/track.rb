module SpotifyToMp3
  class Grooveshark
    class Track
      attr_reader :client_track

      def initialize(client_track)
        @client_track = client_track
      end

      def to_s
        "#{@client_track.artist.strip} - #{@client_track.name.strip}"
      end

      def filename
        "#{self}.mp3".tr('/', '-') # / is not allowed in file names
      end
    end
  end
end
