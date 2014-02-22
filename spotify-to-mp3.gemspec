Gem::Specification.new do |gem|
  gem.name = 'spotify-to-mp3'
  gem.summary = 'Spotify to MP3'
  gem.description = 'Download Spotify tracks as MP3 files from Grooveshark'
  gem.version = '0.5.2'
  gem.author = 'Francesc Rosàs'
  gem.email = 'francescrosasbosque@gmail.com'
  gem.homepage = 'https://github.com/frosas/spotify-to-mp3'

  gem.add_runtime_dependency 'grooveshark'
  gem.add_runtime_dependency 'colorize'
  gem.add_runtime_dependency 'rest-client'
  gem.add_runtime_dependency 'json_pure'

  gem.add_development_dependency 'rspec'

  gem.files = `git ls-files`.split("\n")
  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']
end
