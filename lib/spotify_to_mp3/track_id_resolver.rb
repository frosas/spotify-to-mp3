module SpotifyToMp3
  class TrackIdResolver
    def resolve(track_id)
      resolve_spotify_track(track_id) || resolve_plain_track(track_id)
    end

    private

    def resolve_spotify_track(id)
      resolver = Spotify::UriResolver.new
      if resolver.resolvable?(id)
        spotify_track = resolver.resolve(id)
        description = "#{spotify_track.artist} - #{spotify_track.name}"
        grooveshark_query = "artist:\"#{spotify_track.artist}\" title:\"#{spotify_track.name}\""
        Track.new(description, grooveshark_query)
      end
    end

    def resolve_plain_track(id)
      Track.new(id)
    end
  end
end
