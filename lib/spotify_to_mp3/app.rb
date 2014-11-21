require 'fileutils'
require 'spotify_to_mp3/app/stream_track_ids'

module SpotifyToMp3
  class App
    def initialize(track_id_resolver, grooveshark, logger)
      @track_id_resolver = track_id_resolver
      @grooveshark = grooveshark
      @logger = logger
    end

    def run
      StreamTrackIds.new(ARGF).each do |track_id|
        begin
          @logger.info "Resolving \"#{track_id}\""
          track = @track_id_resolver.resolve(track_id)

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
    rescue
      @logger.error "#{$!}"
    end
  end
end
