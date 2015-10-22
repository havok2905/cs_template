require 'thor'
require 'fileutils'
require 'system_manager'

module CsTemplate
  class Generator < Thor
    include SystemManager

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
  end
end
