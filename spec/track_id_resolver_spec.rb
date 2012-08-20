require 'spotify_to_mp3'

describe SpotifyToMp3::TrackIdResolver do
  before(:each) do
    @resolver = SpotifyToMp3::TrackIdResolver.new
  end

  it "resolves Spotify HTTP URLs" do
    track = @resolver.resolve('http://open.spotify.com/track/0qgiFuYhYuwtFXEwYakddE')
    track.to_s.should == "Cake - I Will Survive"
  end

  it "resolves Spotify URIs" do
    track = @resolver.resolve('spotify:track:0qgiFuYhYuwtFXEwYakddE')
    track.to_s.should == "Cake - I Will Survive"
  end

  it "resolves track titles" do
    track = @resolver.resolve('Cake - I Will Survive')
    track.to_s.should == "Cake - I Will Survive"
  end
end
