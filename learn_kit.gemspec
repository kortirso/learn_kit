lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'learn_kit/version'

Gem::Specification.new do |spec|
  spec.name = 'learn_kit'
  spec.version = LearnKit::VERSION
  spec.authors = ['kortirso']
  spec.email = ['kortirso@gmail.com']

  spec.summary = 'Machine Learning library'
  spec.description = 'Tools for machine learning with ruby'
  spec.homepage = 'https://github.com/kortirso/learn_kit'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5.0'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.57.2'
  spec.add_dependency 'descriptive_statistics'
end
