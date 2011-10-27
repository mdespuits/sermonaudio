$:.push File.expand_path("../lib", __FILE__)
require "sermonaudio/version"

Gem::Specification.new do |s|
  s.name        = "sermonaudio"
  s.version     = Sermonaudio::Version::VERSION
  s.authors     = ["Matt Bridges"]
  s.email       = ["mbridges.91@gmail.com"]
  s.homepage    = "https://github.com/mattdbridges/sermonaudio"
  s.summary     = %q{interface the SermonAudio API easily.}
  s.description = %q{sermonaudio uses the Savon gem to interface with SermonAudio as easily as possible.}

  s.rubyforge_project = s.name

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "savon"
end
