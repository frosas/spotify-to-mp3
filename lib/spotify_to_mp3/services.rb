require 'cgi'

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

  class Spotify
      
    def track(uri)
      content = open('http://ws.spotify.com/lookup/1/.json?uri=' + CGI.escape(uri))
      json = JSON.parse(content.string)
      Track.new(json)
    end

    class Track
      
      attr_reader :name, :artist

      def initialize(json)
        @name = json['track']['name']
        @artist = json['track']['artists'].first['name']
      end
    end
  end
end