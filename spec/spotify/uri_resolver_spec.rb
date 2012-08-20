require 'spotify_to_mp3'

describe SpotifyToMp3::Spotify::UriResolver do
  before(:each) do
    @resolver = SpotifyToMp3::Spotify::UriResolver.new
  end

  context '#resolve' do
    it "resolves HTTP URLs" do
      track = @resolver.resolve('http://open.spotify.com/track/0qgiFuYhYuwtFXEwYakddE')
      track.name.should == "I Will Survive"
      track.artist.should == "Cake"
    end

    it "resolves Spotify URIs" do
      track = @resolver.resolve('spotify:track:0qgiFuYhYuwtFXEwYakddE')
      track.name.should == "I Will Survive"
      track.artist.should == "Cake"
    end

    it "fails on nonexistent URI" do
      expect { @resolver.resolve('spotify:track:not-found') }.to raise_error
    end
  end

  context "#resolvable?" do
    it "accepts HTTP URLs" do
      @resolver.resolvable?('http://open.spotify.com/track/0qgiFuYhYuwtFXEwYakddE').should be_true
    end

    it "accepts Spotify URIs" do
      @resolver.resolvable?('spotify:track:0qgiFuYhYuwtFXEwYakddE').should be_true
    end

    it "refuses other URIs" do
      @resolver.resolvable?('123').should be_false
    end
  end
end
