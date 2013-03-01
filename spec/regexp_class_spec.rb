$:.unshift File.expand_path('../lib', __FILE__)

require 'rspec'
require 'valid_addr.rb'

describe AddressFormat do
  subject{AddressFormat.new}

  it 'should be an object of AddressFormat' do
    subject.class.should eq AddressFormat
  end

  it '#new_format method should accept a hash of parameters to describe address left to right' do
    subject.new_format( {max_digits: 5, EW: 'N|S|E|W|SE', name: 'name', suffix: 'suffix', type: 'type', NS: 'N|S|E|W|SE'} )
  end

  it '#new_format should put the format into an instance hash' do
    subject.new_format( {max_digits: 5, EW: 'N|S|E|W|SE', name: 'name', suffix: 'suffix', type: 'type', NS: 'N|S|E|W|SE'} )
    subject.addr_format.should == {max_digits: 5, EW: 'N|S|E|W|SE', name: 'name', suffix: 'suffix', type: 'type', NS: 'N|S|E|W|SE'}
  end

end