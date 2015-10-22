require 'thor'
require 'fileutils'

module CsTemplate
  class Generator < Thor

    desc 'install', 'Installs the sass files.'
    def install
      seven_one_pattern.each do |dir_name|
        copy_directory(dir_name) || init_directory(dir_name) || nil
      end
      gem_install 'bourbon'
      gem_install 'neat'
    end

    desc 'destroy', 'BEWARE! Destroys all SASS files.'
    def destroy
      seven_one_pattern.each do |dir_name|
        destroy_directory(dir_name) || nil
      end
    end

    private

    def seven_one_pattern
      %w(base components layout pages themes utils vendor)
    end

    def gem_install(gem)
      FileUtils.cd 'vendor'
      system "#{gem} install"
      FileUtils.cd '../'
    end

    def copy_directory(dir_name)
      a_path = asset_path dir_name
      l_path = local_path dir_name
      return if empty_directory?(a_path) || local_directory?(l_path)
      FileUtils.cp_r a_path, './'
    end

    def init_directory(dir_name)
      a_path = asset_path dir_name
      l_path = local_path dir_name
      return if full_directory?(a_path) || local_directory?(l_path)
      FileUtils.mkdir_p dir_name
    end

    def destroy_directory(dir_name)
      path = local_path dir_name
      return unless !local_directory? path
      FileUtils.rm_r dir_name
    end

    def asset_path(dir_name)
      root_dir = File.dirname(File.dirname(File.dirname(__FILE__)))
      File.join root_dir, 'app', 'assets', 'stylesheets', dir_name
    end

    def local_path(dir_name)
      "./#{dir_name}"
    end

    def empty_directory?(path)
      (Dir[path].entries - %w{ . .. }).empty?
    end

    def full_directory?(path)
      !(Dir[path].entries - %w{ . .. }).empty?
    end

    def local_directory?(path)
      File.directory? path
    end
  end
end
