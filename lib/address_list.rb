$:.unshift File.expand_path('../lib', __FILE__)

require 'address.rb'

class AddressList

  TYPES = %w(ST RD AV AVE WY WAY CT PL)
  DIRS = %w(N S E W SE SW)

  attr_reader :addresses, :address_list

  def initialize(input_file)
    @address_list = IO.read(input_file).split("\n")
    @addresses = @address_list.map do |item|
      Address.new(item)
    end
  end

end