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

  end
end
