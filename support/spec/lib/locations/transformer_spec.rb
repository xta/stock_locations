require 'spec_helper'

describe Locations::Transformer do

  let(:input)   {File.join(File.dirname(__FILE__), '..', '..', 'fixtures', 'input.yml')}
  let(:output)  {File.join(File.dirname(__FILE__), '..', '..', 'temp', 'output.geojson')}

  it "accepts the expected params" do
    args = {
      input: input,
      output: output
    }

    expect{Locations::Transformer.new(args)}.not_to raise_error
  end

  it "loads the input data" do
    expected_data = {"type"=>"FeatureCollection", "features"=>[{"type"=>"Feature", "geometry"=>{"type"=>"Point", "coordinates"=>[-73.975491, 40.75162]}, "properties"=>{"name"=>"Chrysler Building", "address"=>"405 Lexington Ave, New York, NY 10174"}}, {"type"=>"Feature", "geometry"=>{"type"=>"Point", "coordinates"=>[-73.985596, 40.748516]}, "properties"=>{"name"=>"Empire State Building", "address"=>"350 5th Ave, New York, NY 10118"}}]}

    args = {
      input: input,
      output: output
    }

    t = Locations::Transformer.new(args)
    expect(t.loaded_data).to eql expected_data
  end

  it "writes the output at the specific location" do
    expected_path   = File.dirname(__FILE__), '..', '..', 'fixtures', 'output.geojson'
    expected_file   = File.read(File.join(expected_path))
    expected_output = JSON.parse(expected_file)

    args = {
      input: input,
      output: output
    }

    t = Locations::Transformer.new(args)
    t.write!

    actual_output = JSON.parse(File.read(output))
    expect(actual_output).to eql expected_output
  end

  after(:all) do
    File.delete(output) if File.exist?(output)
  end

end
