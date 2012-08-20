module SpotifyToMp3
  class Grooveshark
    def initialize
      @client = ::Grooveshark::Client.new
    end

    def song_url(song)
      @client.get_song_url(song)
    end

    def song(query)
      song = @client.search_songs(query).first
      raise "Song not found" if song.nil?
      song
    end
  end
end
