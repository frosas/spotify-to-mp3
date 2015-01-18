require 'spotify_to_mp3/track'

module SpotifyToMp3
  class QueryResolver
    def initialize(spotify)
      @spotify = spotify
    end

    def resolve(query)
      tracks = []

      if @spotify.track_uri?(query)
        spotify_track = @spotify.get_track(query)
        tracks << convert_spotify_track(spotify_track)
      elsif @spotify.album_uri?(query)
        spotify_album = @spotify.get_album(query)
        spotify_album.tracks.each { |track| tracks << convert_spotify_track(track) }
      else
        tracks << resolve_plain_track(query)
      end

      tracks
    end

    def convert_spotify_track(track)
      description = "#{track.artist} - #{track.name}"
      grooveshark_query = "artist:\"#{track.artist}\" title:\"#{track.name}\""

      Track.new(description, grooveshark_query)
    end

    def resolve_plain_track(description)
      Track.new(description)
    end

    private :convert_spotify_track, :resolve_plain_track

  end
end
