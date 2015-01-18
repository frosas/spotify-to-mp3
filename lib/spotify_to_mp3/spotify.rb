require 'rspotify'
require 'spotify_to_mp3/spotify/track'

module SpotifyToMp3
  class Spotify
    def get_track(uri)
      track_id = uri.sub(/.*:/, '')
      track_id = track_id.sub(/.*\//, '') if uri.start_with?('http')

      track = RSpotify::Track.find(track_id)
      Track.new(track.artists.first.name, track.name)
    end

    def resolvable_uri?(uri)
      uri.start_with?('http://open.spotify.com/track/', 'spotify:track:')
    end
  end
end
