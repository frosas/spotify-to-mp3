require 'fileutils'
require 'spotify_to_mp3/app/stream_queries'

module SpotifyToMp3
  class App
    def initialize(query_resolver, grooveshark, logger)
      @query_resolver = query_resolver
      @grooveshark = grooveshark
      @logger = logger
    end

    def run
      StreamQueries.new(ARGF).each do |query|
        @logger.info "Resolving \"#{query}\""
        tracks = @query_resolver.resolve(query)

        tracks.each do |track|
          begin
            @logger.info "Searching \"#{track}\" on Grooveshark"
            grooveshark_track = @grooveshark.get_track(track.grooveshark_query)

            if File.exists?(grooveshark_track.filename)
              # To know about songs no longer in download list
              FileUtils.touch grooveshark_track.filename

              @logger.info "Skipping \"#{grooveshark_track}\", it already exists"
            else
              @logger.info "Downloading \"#{grooveshark_track}\""
              @grooveshark.download(grooveshark_track)
            end
          rescue Exception => exception # For some reason without the "Exception" it is ignored
            @logger.error exception.message
            # Continue with the next track
          end
        end
      end
    rescue
      @logger.error "#{$!}"
    end
  end
end
