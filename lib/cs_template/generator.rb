require 'thor'
require 'fileutils'

module CsTemplate
  class Generator < Thor

    desc 'install', 'Installs the sass files.'
    def install
      sass_files_install
      gem_install 'bourbon'
      gem_install 'neat'
    end

    desc 'destroy', 'BEWARE! Destroys all SASS files.'
    def destroy
      sass_files_destroy
    end

    private

    def seven_one_pattern
      %w(base components layout pages themes utils vendor)
    end

    def main_scss
      'main.scss'
    end

    def sass_files_install
      seven_one_pattern.each do |dir_name|
        copy_directory(dir_name) || init_directory(dir_name) || nil
      end
      main_scss_install
    end

    def main_scss_install
      !File.file?(main_scss) && FileUtils.cp_r(asset_path(main_scss), './')
    end

    def sass_files_destroy
      seven_one_pattern.each do |dir_name|
        destroy_directory(dir_name) || nil
      end
      main_scss_destroy
    end

    def main_scss_destroy
      File.file?(main_scss) && FileUtils.rm_r(local_path(main_scss))
    end

    def copy_directory(dir_name)
      a_path = asset_path dir_name
      l_path = local_path dir_name
      return if empty_directory?(a_path) || File.directory?(l_path)
      FileUtils.cp_r a_path, './'
    end

    def init_directory(dir_name)
      a_path = asset_path dir_name
      l_path = local_path dir_name
      return if !empty_directory?(a_path) || File.directory?(l_path)
      FileUtils.mkdir_p dir_name
    end

    def destroy_directory(dir_name)
      path = local_path dir_name
      return if !File.directory? path
      FileUtils.rm_r path
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

    def gem_install(gem)
      FileUtils.cd 'vendor'
      system "#{gem} install"
      FileUtils.cd '../'
    end
  end
end
