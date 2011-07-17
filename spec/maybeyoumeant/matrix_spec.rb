require 'helper'

describe Matrix do
  it "adds an index setter to ::Matrix" do
    ::Matrix.instance_methods.should include '[]='
  end

  it "should set values in a ::Matrix" do
    m = ::Matrix[[0, 0, 0], [0, 0, 0]]
    m[1, 2] = 3
    m[1, 2].should == 3
  end
end

