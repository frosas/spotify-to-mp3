module SpotifyToMp3
  class Spotify
    def get_track(uri)
      content = open('http://ws.spotify.com/lookup/1/.json?uri=' + CGI.escape(uri))
      json = JSON.parse(content.string)
      Track.new(json)
    end

    def resolvable_uri?(uri)
      uri.start_with?('http://open.spotify.com/track/', 'spotify:track:')
    end
  end
end
