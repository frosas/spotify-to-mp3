module SpotifyToMp3
  class Track
    attr_reader :grooveshark_query

    def initialize(description, grooveshark_query = nil)
      @description = description
      @grooveshark_query = grooveshark_query || @description
    end

    def to_s
      @description
    end
  end
end
