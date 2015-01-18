require 'rspotify'
require 'spotify_to_mp3/spotify/track'
require 'spotify_to_mp3/spotify/album'

module SpotifyToMp3
  class Spotify
    def get_track(uri)
      track_id = parse_id(uri)
      track = RSpotify::Track.find(track_id)
      Track.new(track.artists.first.name, track.name)
    end

    def get_album(uri)
      album_id = parse_id(uri)
      album = RSpotify::Album.find(album_id)

      tracks = []
      album.tracks.each do |track|
        tracks << Track.new(album.artists.first.name, track.name)
      end

      Album.new(album.artists.first.name, album.name, tracks)
    end

    def track_uri?(uri)
      uri.start_with?('http://open.spotify.com/track/', 'spotify:track:')
    end

    def album_uri?(uri)
      uri.start_with?('http://open.spotify.com/album/', 'spotify:album:')
    end

    def parse_id(uri)
      id = uri.sub(/.*:/, '')
      id = id.sub(/.*\//, '') if uri.start_with?('http')
      id
    end

    private :parse_id

  end
end
