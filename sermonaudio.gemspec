$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'sermonaudio/version'

Gem::Specification.new do |s|
  s.name        = 'sermonaudio'
  s.version     = SermonAudio::Version::VERSION
  s.authors     = ['Matt Bridges']
  s.email       = ['mbridges.91@gmail.com']
  s.homepage    = 'https://github.com/mattdbridges/sermonaudio'
  s.summary     = 'SermonAudio API interface for Ruby.'
  s.description = 'sermonaudio uses the Savon gem to interface with SermonAudio as easily as possible.'

  s.rubyforge_project = s.name

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency "savon", "~> 2.11.0"
  s.add_dependency "nokogiri", "1.6.6.2"
end
