require 'spec_helper'

describe Locations::Transformer do

  let(:input) {File.join(File.dirname(__FILE__), '..', 'fixtures', 'input.yml')}
  let(:output) {File.join(File.dirname(__FILE__), '..', 'temp', 'output.geojson')}

  it "accepts the expected params" do
    args = {
      input: input,
      output: output
    }

    expect{Locations::Transformer.new(args)}.not_to raise_error
  end

  it "transforms the input into the output format" do
    expected_output = '{"type":"FeatureCollection","features":[{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.975491,40.75162]},"properties":{"name":"Chrysler Building","address":"405 Lexington Ave, New York, NY 10174"}},{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.985596,40.748516]},"properties":{"name":"Empire State Building","address":"350 5th Ave, New York, NY 10118"}}]}'

    args = {
      input: input,
      output: output
    }

    t = Locations::Transformer.new(args)
    expect(t.as_json).to eql expected_output
  end

  it "writes the output at the specific location" do
    # TODO
  end

  after(:all) do
    # clean up temp/
  end

end
