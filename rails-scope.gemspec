# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "rails-scope"
  spec.version       = "0.0.1"
  spec.authors       = ["Ken Johnson"]
  spec.email         = ["contact@nvisium.com"]
  spec.summary       = %q{
                        Assists nVisium in scoping and pricing Rails assessments for our clients.
                        }
  spec.description   = %q{
  						Ruby gem that allows nVisium to accurately and automatically scope a Ruby on Rails application for assessment purposes.
                        }
  spec.homepage      = "https://github.com/nVisium/rails-scope"
  spec.license       = "MIT"

  spec.files        = %w(LICENSE.txt README.md)
  spec.files       += Dir.glob('bin/**/*')
  spec.files	     += Dir.glob('lib/**/*')
  spec.files       += Dir.glob('spec/**/*')
  spec.test_files   = Dir.glob('spec/**/*')
  spec.executables  = %w(rails-scope)
  spec.require_path = '.'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_runtime_dependency "brakeman", "~>3.0"
  # So I guess Brakeman needs this in some cases
  spec.add_runtime_dependency "slim", "~>3.0"
  spec.add_runtime_dependency "flog", "~>4.3"
  spec.add_runtime_dependency "flay", "~>2.6"
end