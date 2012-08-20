require 'spotify_to_mp3'

module SpotifyToMp3
  describe Spotify do
    before(:each) do
      @spotify = SpotifyToMp3::Spotify.new
    end

    context '#get_track' do
      it "resolves HTTP URLs" do
        track = @spotify.get_track('http://open.spotify.com/track/0qgiFuYhYuwtFXEwYakddE')
        track.name.should == "I Will Survive"
        track.artist.should == "Cake"
      end

      it "resolves Spotify URIs" do
        track = @spotify.get_track('spotify:track:0qgiFuYhYuwtFXEwYakddE')
        track.name.should == "I Will Survive"
        track.artist.should == "Cake"
      end

      it "fails on nonexistent URI" do
        expect { @spotify.get_track('spotify:track:not-found') }.to raise_error
      end
    end

    context "#resolvable_uri?" do
      it "accepts HTTP URLs" do
        @spotify.resolvable_uri?('http://open.spotify.com/track/0qgiFuYhYuwtFXEwYakddE').should be_true
      end

      it "accepts Spotify URIs" do
        @spotify.resolvable_uri?('spotify:track:0qgiFuYhYuwtFXEwYakddE').should be_true
      end

      it "refuses other URIs" do
        @spotify.resolvable_uri?('123').should be_false
      end
    end
  end
end
