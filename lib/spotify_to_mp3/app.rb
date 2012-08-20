module SpotifyToMp3
  class App
    def run
      file = ARGV.first
      raise "No songs file specified. Usage: #{$0} file" if file.nil?

      File.open(file).each_line do |track_id|
        track_id.strip!
        next if track_id.empty?
        begin
          puts "Resolving \"#{track_id}\" ".blue
          track = TrackIdResolver.new.resolve(track_id)

          puts "Searching \"#{track}\" on Grooveshark ".blue
          grooveshark_track = grooveshark.get_track(track.grooveshark_query)

          puts "Downloading \"#{grooveshark_track}\" ".blue
          if File.exists? grooveshark_track.filename
            FileUtils.touch grooveshark_track.filename # To know about songs no longer in download list
            puts "Already exists, skipping".green
          else
            grooveshark.download(grooveshark_track)
            puts "Done".green
          end
        rescue Exception => exception # For some reason without the "Exception" it is ignored
          puts exception.message.red
          # exception.backtrace.each{ |step| puts step.red }
          # Continue with the next track
        end
      end
    rescue
      puts "#{$!}".red
    end

    private

    def grooveshark
      @grooveshark ||= Grooveshark.new
    end
  end
end
