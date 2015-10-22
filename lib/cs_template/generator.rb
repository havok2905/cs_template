require 'thor'
require 'fileutils'

module CsTemplate
  class Generator < Thor

    desc 'install', 'Installs the sass files'
    def generate_sass_files
      generate_sass_files
    end

    private

    def seven_one_pattern
      %w(base components layout pages themes utils vendor)
    end

    def generate_sass_files
      seven_one_pattern.each do |dir_name|
        FileUtils.mkdir_p dir_name
      end
    end

    def generate_bourbon
    end

    def generate_neat
    end
  end
end
