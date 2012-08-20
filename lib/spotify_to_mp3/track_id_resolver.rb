module SpotifyToMp3
  class TrackIdResolver
    def resolve(track_id)
      resolver = Spotify::UriResolver.new
      if resolver.resolvable?(track_id)
        track = SpotifyToMp3::Spotify::UriResolver.new.resolve(track_id)
        source = SpotifySource.new(track)
      else
        source = PlainSource.new(track_id)
      end
      ResolvedSong.new(source)
    end
  end
end
