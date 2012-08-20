module SpotifyToMp3
  module Spotify
    class UriResolver
      def resolve(uri)
        content = open('http://ws.spotify.com/lookup/1/.json?uri=' + CGI.escape(uri))
        json = JSON.parse(content.string)
        Track.new(json)
      end

      def resolvable?(uri)
        uri.start_with?('http://open.spotify.com/track/', 'spotify:track:')
      end
    end
  end
end
