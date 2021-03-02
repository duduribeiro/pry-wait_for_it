# frozen_string_literal: true

require_relative "lib/pry-wait_for_it/version"

Gem::Specification.new do |spec|
  spec.name          = "pry-wait_for_it"
  spec.version       = PryWaitForIt::VERSION
  spec.authors       = ["Cadu Ribeiro"]
  spec.email         = ["mail@cadu.dev"]

  spec.summary       = "Executes pry only when activated"
  spec.description   = "Do not want to block all calls to pry and only debug in a specific block? wait for it.."
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "pry"
  spec.add_dependency "concurrent-ruby"
end
