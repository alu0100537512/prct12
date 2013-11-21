# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ETSII_GEM/version'

Gem::Specification.new do |spec|
  spec.name          = "ETSII_GEM"
  spec.version       = ETSIIGEM::VERSION
  spec.authors       = ["Héctor J. & Enrique Tejera"]
  spec.email         = ["alu0100603170@ull.edu.es"]
  spec.description   = %q{"Gema para la representación de matrices, tanto densas como dispersas."}
  spec.summary       = %q{"Existe una clase madre llamada 'Matriz' de la que heredan dos subclases, 'Densa' para las matrices densas y 'Dispersa' para las matrices dispersas."}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
