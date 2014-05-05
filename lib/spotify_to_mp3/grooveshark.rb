require 'fileutils'
require 'rest-client'
require 'spotify_to_mp3/grooveshark/track'

module SpotifyToMp3
  class Grooveshark
    def initialize(client)
      @client = client
    end

    def get_track(query)
      client_track = @client.search_songs(query).first or raise "Track not found"
      Track.new(client_track)
    end

    def download(track)
      url = @client.get_song_url(track.client_track)
      file = RestClient::Request.execute(:method => :post, :url => url, :raw_response => true).file
      FileUtils.mv(file.path, track.filename)
    end
  end
end
