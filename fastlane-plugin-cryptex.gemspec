
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/cryptex/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-cryptex'
  spec.version       = Fastlane::Cryptex::VERSION
  spec.author        = 'Jaime Davila' # 'Helmut Januschka' # please remember this is a fork of Helmut's project to apply a fix needed to keep working
  spec.email         = 'jaime@diablourbano.com'

  spec.summary       = 'fastlane Crypt Store Git repo fork with fix to avoid list-versions frozen'
  spec.homepage      = "https://github.com/vitalbeats/fastlane-plugin-cryptex.git"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w[bin/cryptex README.md LICENSE]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  spec.add_dependency 'commander', '>= 4.3.5'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'fastlane', '>= 1.105.2'
  spec.add_development_dependency 'match', '>= 0.8.1'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
