# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'age_jp/version'

Gem::Specification.new do |spec|
  spec.name          = "age_jp"
  spec.version       = AgeJp::VERSION
  spec.authors       = ["ryoff"]
  spec.email         = ["ryoffes@gmail.com"]
  spec.summary       = %q{A simpel age calculator for a law of Japan.}
  spec.description   = %q{A simpel age calculator for a law of Japan.}
  spec.homepage      = "https://github.com/ryoff/age_jp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", '~> 3.0'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "timecop", '~> 0.7'
  spec.add_development_dependency 'pry'
end
