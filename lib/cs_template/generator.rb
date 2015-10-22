require 'thor'
require 'fileutils'

module CsTemplate
  class Generator < Thor

    desc 'install', 'Installs the sass files.'
    def install
      generate_sass_files
    end

    desc 'destroy', 'BEWARE! Destroys all SASS files.'
    def destroy
      destroy_sass_files
    end

    private

    def seven_one_pattern
      %w(base components layout pages themes utils vendor)
    end

    def generate_sass_files
      puts File.dirname(__FILE__)

      seven_one_pattern.each do |dir_name|
        FileUtils.mkdir_p dir_name
      end
    end

    def destroy_sass_files
      seven_one_pattern.each do |dir_name|
        FileUtils.rm_r dir_name
      end
    end

    def generate_bourbon
    end

    def generate_neat
    end
  end
end
