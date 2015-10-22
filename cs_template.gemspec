# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cs_template/version'

Gem::Specification.new do |spec|
  spec.name          = "cs_template"
  spec.version       = CsTemplate::VERSION
  spec.authors       = ["Chris McLean"]
  spec.email         = ["havok2905@gmail.com"]

  spec.summary       = %q{Kick off any project with SASS}
  spec.description   = %q{A base sass template for kicking off new projects}
  spec.homepage      = "https://github.com/havok2905/cs-template"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["cs_template"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'sass', '~> 3.4'
  spec.add_runtime_dependency 'bourbon', '~> 4.2'
  spec.add_runtime_dependency 'neat', '~> 1.7'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
