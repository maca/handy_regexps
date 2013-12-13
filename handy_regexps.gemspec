# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'handy_regexps/version'

Gem::Specification.new do |spec|
  spec.name          = "handy_regexps"
  spec.version       = HandyRegexps::VERSION
  spec.authors       = ["macario"]
  spec.email         = ["mail@makarius.me"]
  spec.description   = %q{Some useful regular expressions}
  spec.summary       = %q{Some useful regular expressions}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "ffaker"
end

