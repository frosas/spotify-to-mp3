Gem::Specification.new do |s|
  s.name = 'spotify-to-mp3'
  s.summary = 'Spotify to MP3'
  s.description = 'Download MP3 files of Spotify tracks'
  s.version = '0.3'
  s.author = 'Francesc Rosàs'
  s.email = 'francescrosasbosque@gmail.com'
  s.homepage = 'https://github.com/frosas/spotify-to-mp3'

  s.add_dependency 'grooveshark'
  s.add_dependency 'colorize'

  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  s.require_paths = ['.']
end
