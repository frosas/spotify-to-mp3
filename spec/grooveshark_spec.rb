require 'spotify_to_mp3'

module SpotifyToMp3
  describe Grooveshark do
    context "#get_track" do
      before(:each) do
        @grooveshark = DependencyInjection.new.grooveshark
      end

      it "finds by plain query" do
        @grooveshark.get_track("Cake - I Will Survive").should be
      end

      it "finds by artist and title" do
        @grooveshark.get_track('artist:"Cake" title:"I Will Survive"').should be
      end

      it "fails with nonexistent tracks" do
        expect { @grooveshark.get_track('XXXXXXXXXXXXXXX') }.to raise_error
      end
    end
  end
end
