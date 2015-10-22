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

    def generate_sass_files
      seven_one_pattern.each do |dir_name|
        copy_directory(dir_name) || init_directory(dir_name)
      end
    end

    def destroy_sass_files
      seven_one_pattern.each do |dir_name|
        FileUtils.rm_r dir_name
      end
    end

    def seven_one_pattern
      %w(base components layout pages themes utils vendor)
    end

    def asset_path(dir_name)
      root_dir = File.dirname(File.dirname(File.dirname(__FILE__)))
      File.join root_dir, 'app', 'assets', 'stylesheets', dir_name
    end

    def copy_directory(dirname)
      path = asset_path dir_name
      return if (Dir[path].entries - %w{ . .. }).empty?
      FileUtils.cp_r asset_path(dir_name), './'
    end

    def init_directory(dirname)
      FileUtils.makdir_p asset_path(dir_name)
    end

    def generate_bourbon
    end

    def generate_neat
    end
  end
end
