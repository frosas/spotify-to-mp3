module SpotifyToMp3
  class App
    class StreamQueries
      include Enumerable

      def initialize(stream)
        @stream = stream
      end

      def each
        @stream.each do |query|
          query.strip!
          next if query.empty?
          yield query
        end
      end
    end
  end
end
