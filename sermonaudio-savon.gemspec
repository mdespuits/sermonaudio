# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sermonaudio-savon/version"

Gem::Specification.new do |s|
  s.name        = "sermonaudio-savon"
  s.version     = Sermonaudio::Savon::VERSION
  s.authors     = ["Matt Bridges"]
  s.email       = ["mbridges.91@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{interface the SermonAudio API easily.}
  s.description = %q{SermonAudio-Savon uses the Savon gem to interface with SermonAudio as easily as possible.}

  s.rubyforge_project = "sermonaudio-savon"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency = "savon"

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
