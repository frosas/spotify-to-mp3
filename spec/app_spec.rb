require 'spotify_to_mp3'
require 'tempfile'

module SpotifyToMp3
  class App
    describe App do
      before(:each) do
        @app = DependencyInjection.new.app
      end

      context "#file_track_ids" do
        it "reads lines" do
          open_test_file("1\n2\n3") do |file|
            @app.file_track_ids(file).count.should == 3
          end
        end

        it "trims spaces" do
          open_test_file(" 1 ") do |file|
            @app.file_track_ids(file) do |track_id|
              track_id.should == "1"
            end
          end
        end

        it "ignores empty lines" do
          open_test_file("1\n\n2\n") do |file|
            @app.file_track_ids(file).count.should == 2
          end
        end
      end

      def open_test_file(content)
        Tempfile.open('tracks') do |file|
          file.write(content)
          file.rewind
          yield file
        end
      end
    end
  end
end
