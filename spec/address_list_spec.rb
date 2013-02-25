$:.unshift File.expand_path('../lib', __FILE__)

require 'rspec'
require 'valid_addr.rb'

describe AddressList do

  subject{ AddressList.new('spec/test_addresses.txt') }

  it 'should be a class' do
    subject.class.should eq AddressList
  end

  it 'should have .addresses method' do
    subject.respond_to?(:addresses).should eq true

  end

  it ':addresses should return a list of addresses'do
    subject.addresses.should eq ["27520 COVINGTON WAY SE", "28401 COVINGTON WAY SE", "16400 SE 251ST ST", "16735 SE 272ND ST", "17070 SE WAX RD", "17102 SE 269TH PL", "17110 SE 268TH PL", "17114 SE 269TH PL", "17126 SE 269TH PL", "17700 SE 272ND ST", "18230 SE 240TH ST", "25225 180TH AVE SE", "25411 156TH AVE SE", "25800 164TH AVE SE", "25810 156TH AVE SE", "26308 185TH AVE SE", "26500 TIMBERLANE WAY SE", "26609 199TH PL SE", "26706 171ST PL SE", "26723 171ST PL SE", "26724 171ST PL SE", "26805 171ST PL SE", "26808 171ST PL SE", "26900 171ST PL SE", "26902 169TH PL SE", "26904 171ST AVE SE", "26907 171ST PL SE", "26915 186TH AVE SE", "27112 167TH PL SE", "27116 167TH PL SE", "13200 SE Kent Kangley rd", "1234 Timber line AVE SE", "1234 270th", "400 Gowe St"]
  end

  it 'list_convert should convert each element to a hash' do
    subject.list_convert.should eq [{hash: 0}]
  end

end