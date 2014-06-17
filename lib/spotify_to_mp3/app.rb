require 'colorize'
require 'fileutils'
require 'spotify_to_mp3/app/stream_track_ids'

module SpotifyToMp3
  class App
    def initialize(track_id_resolver, grooveshark)
      @track_id_resolver = track_id_resolver
      @grooveshark = grooveshark
    end

    def run
      StreamTrackIds.new(ARGF).each do |track_id|
        begin
          puts "Resolving \"#{track_id}\""
          track = @track_id_resolver.resolve(track_id)

          puts "Searching \"#{track}\" on Grooveshark"
          grooveshark_track = @grooveshark.get_track(track.grooveshark_query)

          if File.exists?(grooveshark_track.filename)
            # To know about songs no longer in download list
            FileUtils.touch grooveshark_track.filename

            puts "Skipping \"#{grooveshark_track}\", it already exists"
          else
            puts "Downloading \"#{grooveshark_track}\""
            @grooveshark.download(grooveshark_track)
          end
        rescue Exception => exception # For some reason without the "Exception" it is ignored
          puts exception.message.red
          # Continue with the next track
        end
      end
    rescue
      puts "#{$!}".red
    end
  end
end
