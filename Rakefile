$:.unshift File.dirname(__FILE__) + 'lib'
require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

task :default => :test

	desc "Pruebas unitarias"
	task :test do
     	   sh "ruby -Ilib -Itest test/tc_ETSII_GEM.rb"
	end
	
	desc "Ejecutar las espectativas de la gema"
	task :spec do
	  sh "rspec -I. spec/ETSII_GEM_spec.rb"
	end