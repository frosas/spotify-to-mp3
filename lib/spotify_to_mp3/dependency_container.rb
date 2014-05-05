require 'grooveshark'
require 'spotify_to_mp3/app'
require 'spotify_to_mp3/grooveshark'
require 'spotify_to_mp3/spotify'
require 'spotify_to_mp3/track_id_resolver'

module SpotifyToMp3
  class DependencyContainer
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
