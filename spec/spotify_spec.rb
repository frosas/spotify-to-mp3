require 'spotify_to_mp3/spotify'

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

    context '#get_album' do
      it "resolves HTTP URLs" do
        album = @spotify.get_album('http://open.spotify.com/album/7wq5vhqramVPzjArlmr70k')
        album.tracks.length.should == 2
        album.name.should == "Suck It and See"
        album.artist.should == "Arctic Monkeys"
      end

      it "resolves Spotify URIs" do
        album = @spotify.get_album('spotify:album:7wq5vhqramVPzjArlmr70k')
        album.tracks.length.should == 2
        album.name.should == "Suck It and See"
        album.artist.should == "Arctic Monkeys"
      end

      it "fails on nonexistent URI" do
        expect { @spotify.get_album('spotify:album:not-found') }.to raise_error
      end
    end
    
    context "#track_uri?" do
      it "accepts HTTP URLs" do
        @spotify.track_uri?('http://open.spotify.com/track/0qgiFuYhYuwtFXEwYakddE').should be_true
      end

      it "accepts Spotify URIs" do
        @spotify.track_uri?('spotify:track:0qgiFuYhYuwtFXEwYakddE').should be_true
      end

      it "refuses other URIs" do
        @spotify.track_uri?('123').should be_false
      end
    end

    context "#album_uri?" do
      it "accepts HTTP URLs" do
        @spotify.album_uri?('http://open.spotify.com/album/7wq5vhqramVPzjArlmr70k').should be_true
      end

      it "accepts Spotify URIs" do
        @spotify.album_uri?('spotify:album:7wq5vhqramVPzjArlmr70k').should be_true
      end

      it "refuses other URIs" do
        @spotify.album_uri?('123').should be_false
      end
    end
  end
end
