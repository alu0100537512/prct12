$:.unshift File.dirname(__FILE__) + 'lib'

#Required files
require "bundler/gem_tasks"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

task :default => :doc

	desc "Pruebas unitarias"
	task :test do
     	   sh "ruby -I. test/tc_ETSII_GEM.rb"
	end

	desc "Ejecutar las espectativas de la gema"
	task :spec do
	  sh "rspec -I. spec/ETSII_GEM_spec.rb"
	end

	desc "Ejecutar con documentacion"
	task :doc do
 	 sh "rspec -I. spec/ETSII_GEM_spec.rb --format documentation"
	end
