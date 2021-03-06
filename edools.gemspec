# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "edools/version"

Gem::Specification.new do |spec|
  spec.name          = "edools"
  spec.version       = Edools::Ruby::VERSION
  spec.authors       = ["Thiago F. Lins"]
  spec.email         = ["thiago.evandson@gmail.com"]

  spec.summary       = "A client for edools API"
  spec.description   = "A client in ruby to access Edools API"
  spec.homepage      = "https://github.com/kidush/edools_ruby"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", "~> 0.13.1"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.6"

  spec.license = 'MIT'

  spec.required_ruby_version = '~> 2.0'
end
