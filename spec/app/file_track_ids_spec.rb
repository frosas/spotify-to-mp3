require 'spotify_to_mp3'
require 'tempfile'

module SpotifyToMp3
  describe App::FileTrackIds do
    it "reads lines" do
      open_test_file("1\n2\n3") do |ids|
        ids.count.should == 3
      end
    end

    it "trims spaces" do
      open_test_file(" 1 ") do |ids|
        ids.each do |id| id.should == "1" end
      end
    end

    it "ignores empty lines" do
      open_test_file("1\n\n2\n") do |ids|
        ids.count.should == 2
      end
    end

    def open_test_file(content)
      Tempfile.open('tracks') do |file|
        file.write(content)
        file.rewind
        yield App::FileTrackIds.new(file)
      end
    end
  end
end
