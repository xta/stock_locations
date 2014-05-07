require 'json'
require 'yaml'

module Locations
  class Transformer

    def initialize(args)
      @input   = args[:input]
      @output  = args[:output]
    end

    def as_json
      data = YAML::load_file(@input)
      JSON.dump(data)
    end

    def write!
      File.open(@output, "w") do |f|
        f.write(as_json)
      end
    end

  end
end
