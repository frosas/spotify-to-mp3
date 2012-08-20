module SpotifyToMp3
  class DependencyInjection
    def track_id_resolver
      @track_id_resolver ||= TrackIdResolver.new(Spotify.new)
    end

    def grooveshark
      @grooveshark ||= Grooveshark.new(::Grooveshark::Client.new)
    end

    def app
      @app ||= App.new(track_id_resolver, grooveshark)
    end
  end
end
