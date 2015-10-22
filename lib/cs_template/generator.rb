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
        next if no_directory asset_path(dir_name)
        FileUtils.rm_r dir_name
      end
    end

    def seven_one_pattern
      %w(base components layout pages themes utils vendor)
    end

    def no_directory(path)
      puts (Dir[path].entries - %w{ . .. })
      return true if (Dir[path].entries - %w{ . .. }).empty?
    end

    def asset_path(dir_name)
      root_dir = File.dirname(File.dirname(File.dirname(__FILE__)))
      File.join root_dir, 'app', 'assets', 'stylesheets', dir_name
    end

    def copy_directory(dir_name)
      path = asset_path dir_name
      return if no_directory path
      FileUtils.cp_r asset_path(dir_name), './'
    end

    def init_directory(dir_name)
      FileUtils.mkdir_p asset_path(dir_name)
    end
  end
end
