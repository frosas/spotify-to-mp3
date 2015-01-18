require 'grooveshark'
require 'spotify_to_mp3/app'
require 'spotify_to_mp3/grooveshark'
require 'spotify_to_mp3/spotify'
require 'spotify_to_mp3/query_resolver'
require 'spotify_to_mp3/logger'

module SpotifyToMp3
  class DependencyContainer
    def query_resolver
      @query_resolver ||= QueryResolver.new(Spotify.new)
    end

    def grooveshark
      @grooveshark ||= Grooveshark.new(::Grooveshark::Client.new)
    end

    def logger
      @logger ||= Logger.new($stdout)
    end

    def app
      @app ||= App.new(query_resolver, grooveshark, logger)
    end

  end
end
