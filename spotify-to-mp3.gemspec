Gem::Specification.new do |gem|
  gem.name = 'spotify-to-mp3'
  gem.summary = 'Spotify to MP3'
  gem.description = 'Download Spotify tracks as MP3 files from Grooveshark'
  gem.version = '0.5.1'
  gem.author = 'Francesc Rosàs'
  gem.email = 'francescrosasbosque@gmail.com'
  gem.homepage = 'https://github.com/frosas/spotify-to-mp3'

  gem.add_dependency 'grooveshark'
  gem.add_dependency 'colorize'
  gem.add_dependency 'rest-client'

  gem.files = `git ls-files`.split("\n")
  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']
end
