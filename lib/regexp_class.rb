$:.unshift File.expand_path('../lib', __FILE__)

class AddressFormat
  attr_reader :addr_format

  def initialize

  end

  def new_format(format)
    @addr_format = format
  end

end