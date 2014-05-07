require 'json'
require 'yaml'

module Locations
  class Transformer

    def initialize(args)
      @input   = args[:input]
      @output  = args[:output]
    end

    def loaded_data
      YAML::load_file(@input)
    end

    def write!
      File.open(@output, "w") do |f|
        f.write(pretty_json)
      end
    end

    private

    def pretty_json
      JSON.pretty_generate(loaded_data)
    end

  end
end
