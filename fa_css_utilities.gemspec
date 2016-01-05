# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fa_css_utilities/version'

Gem::Specification.new do |spec|
  spec.name          = "fa_css_utilities"
  spec.version       = FaCssUtilities::VERSION
  spec.authors       = ["Murray Summers"]
  spec.email         = ["murray@freeagent.com"]
  spec.summary       = "CSS utilities for using and managing FreeAgent design properties consistently"
  spec.description   = "CSS utilities for using and managing FreeAgent design properties consistently"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
