# encoding: utf-8

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'features/packager/version'

Gem::Specification.new do |spec|
  spec.name          = 'features-packager'
  spec.version       = Features::Packager::VERSION
  spec.authors       = ['dataday']
  spec.email         = ['vcs@dataday']
  spec.summary       = 'Features packager for static feature files'
  spec.description   = 'Template to package static features files'
  spec.homepage      = 'http://github.com/dataday/features-packager'
  spec.license       = 'MIT'

  spec.files         = Dir['{features,lib}/**/*', '{bin,exe}/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  spec.test_files    = Dir['spec/**/*']
  spec.require_paths = ['lib']

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'https://gems.cloud.domain.co.uk'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.add_dependency 'cmdparse', '~> 3.0'

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10'
end
