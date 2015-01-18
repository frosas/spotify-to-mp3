require 'spotify_to_mp3/dependency_container'

module SpotifyToMp3
  describe QueryResolver do
    before(:each) do
      @resolver = DependencyContainer.new.query_resolver
    end

    it "resolves Spotify track HTTP URLs" do
      tracks = @resolver.resolve('http://open.spotify.com/track/0qgiFuYhYuwtFXEwYakddE')
      tracks.length.should == 1
      tracks.first.to_s.should == "Cake - I Will Survive"
    end

    it "resolves Spotify track URIs" do
      tracks = @resolver.resolve('spotify:track:0qgiFuYhYuwtFXEwYakddE')
      tracks.length.should == 1
      tracks.first.to_s.should == "Cake - I Will Survive"
    end

    it "resolves Spotify album HTTP URLs" do
      tracks = @resolver.resolve('http://open.spotify.com/album/7wq5vhqramVPzjArlmr70k')
      tracks.length.should == 2
      tracks[0].to_s.should == "Arctic Monkeys - Suck It and See"
      tracks[1].to_s.should == "Arctic Monkeys - Evil Twin"
    end

    it "resolves Spotify album URIs" do
      tracks = @resolver.resolve('spotify:album:7wq5vhqramVPzjArlmr70k')
      tracks.length.should == 2
      tracks[0].to_s.should == "Arctic Monkeys - Suck It and See"
      tracks[1].to_s.should == "Arctic Monkeys - Evil Twin"
    end

    it "resolves track titles" do
      tracks = @resolver.resolve('Cake - I Will Survive')
      tracks.length.should == 1
      tracks.first.to_s.should == "Cake - I Will Survive"
    end
  end
end
