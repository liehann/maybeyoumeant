require 'helper'

describe Levenshtein do
  it "calculates a zero distance between empty strings" do
    Levenshtein.distance('', '').should == 0
  end

  it "calculates a one distance between two characters" do
    Levenshtein.distance('a', 'b').should == 1
  end

  it "calculates a correct distance between two strings" do
    Levenshtein.distance('kitten', 'sitting').should == 3
  end
end

