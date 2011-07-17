require 'helper'

describe ObjectExtentions do
  it 'finds a nearby method' do
    Foo.new.nearby_method(:boo).should == 'foo'
  end

  it 'has a threshold of 2' do
    Foo.new.nearby_method(:foobr).should == 'foo'
  end

  it 'returns nil if there are no nearby methods' do
    Foo.new.nearby_method(:foobar).should be_nil
  end

  it 'calls a similar method if there is one' do
    f = Foo.new
    f.should_receive(:foo)
    f.boo
  end

  it 'raises NoMethodError if there are no similar methods' do
    f = Foo.new
    lambda { f.foobar }.should raise_error NoMethodError
  end
end

