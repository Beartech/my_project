$:.unshift File.expand_path('../lib', __FILE__)

class Address

  attr_reader :number, :name, :suffix, :type, :direction

  def initialize(addr_string)
    addr_list = addr_string.split(' ')
    @number = addr_list[0].to_i
  end

end
