module SpotifyToMp3
  class App
    class StreamTrackIds
      include Enumerable

      def initialize(stream)
        @stream = stream
      end

      def each
        @stream.each do |track_id|
          track_id.strip!
          next if track_id.empty?
          yield track_id
        end
      end
    end
  end
end
