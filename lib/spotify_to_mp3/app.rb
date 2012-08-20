module SpotifyToMp3
  class App
    def run
      file = ARGV.first
      raise "No songs file specified. Usage: #{$0} file" if file.nil?

      File.open(file).each_line{|song_id|
        song_id.strip!
        next if song_id.empty?
        begin
          song = UnresolvedSong.new(song_id)
          print "Resolving \"#{song}\" "
          song = song.resolve
          print "-> Searching \"#{song}\" on Grooveshark "
          song = song.from_grooveshark
          print "-> Downloading \"#{song}\" "
          if File.exists? song.filename
            FileUtils.touch song.filename # To know about songs no longer in download list
            puts "Already exists, skipping".green
          else
            song.download
            puts "Done".green
          end
        rescue Exception => exception # For some reason without the "Exception" it is ignored
          puts exception.message.red
          # Continue with the next track
        end
      }
    rescue
      puts "#{$!}".red
    end
  end
end
