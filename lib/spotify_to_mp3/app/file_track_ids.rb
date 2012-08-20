module SpotifyToMp3
  class App
    class FileTrackIds
      include Enumerable

      def initialize(file)
        @file = file
      end

      def each
        File.open(@file) do |file|
          file.each do |track_id|
            track_id.strip!
            next if track_id.empty?
            yield track_id
          end
        end
      end
    end
  end
end
