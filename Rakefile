$:.unshift File.dirname(__FILE__) + 'lib'
require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

	desc "Pruebas unitarias"
	task :test do
     	   sh "ruby -Ilib test/tc_ETSII_GEM.rb"
	end
