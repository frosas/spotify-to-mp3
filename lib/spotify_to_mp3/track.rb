module SpotifyToMp3
  class Track
    attr_reader :grooveshark_query

    def initialize(id, grooveshark_query = nil)
      @id = id
      @grooveshark_query = grooveshark_query || @id
    end

    def to_s
      @id
    end
  end
end
