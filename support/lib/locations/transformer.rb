require 'json'
require 'yaml'

module Locations
  class Transformer

    def initialize(args)
      @input   = args[:input]
      @output  = args[:output]
    end

    def loaded_data
      if file_is_json?(@input)
        JSON.parse(File.read(@input))
      elsif file_is_yml?(@input)
        YAML::load_file(@input)
      end
    end

    def write!
      File.open(@output, "w") do |f|
        if file_is_json?(@output)
          f.write(pretty_json)
        elsif file_is_yml?(@output)
          f.write(pretty_yaml)
        end
      end
    end

    private

    def pretty_yaml
      loaded_data.to_yaml
    end

    def pretty_json
      JSON.pretty_generate(loaded_data)
    end

    def file_is_yml?(file)
      file.split('.').last.include?('yml')
    end

    def file_is_json?(file)
      file.split('.').last.include?('json')
    end

  end
end
