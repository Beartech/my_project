$:.unshift File.expand_path('../lib', __FILE__)

class AddressList

  TYPES = %w(ST RD AV AVE WY WAY CT PL)
  DIRS = %w(N S E W SE SW)

  attr_reader :addresses

  def initialize(input_file)
    @addresses = IO.read(input_file).split("\n")
    @diced_list = @addresses.map do |address|
       address.upcase.split(' ')
    end
  end

  def list_convert
    converted = @diced_list.map do |list|
      if DIRS.include?(list[1])
        if list[2] =~ /\d{1,3}[a-z]{2}/i
          h = {:number => list.shift,
           :dir => list.shift,
           :name => list[0][0...(/\D/ =~ list[0])],
           :suffix => list[0][(/\D/ =~ list.shift)..-1],
           :type => list.shift}
        elsif TYPES.include?(list[-1])
          h = {:number => list.shift,
           :dir => list.shift,
           :name => (list.slice!(0...-1)).join(' '),
           :type => list.shift}
        else
          h = {:address => list, :flag => true}
        end
      elsif list[1] =~ /\d{1,3}[a-z]{2}/i
        h = {:number => list.shift,
         :name => list[0][0...(/\D/ =~ list[0])],
         :suffix => list[0][(/\D/ =~ list.shift)..-1],
         :type => list.shift,
         :dir => list.shift}
      elsif DIRS.include?(list[-1])
        if TYPES.include?(list[-2])
          h = {:number => list.shift,
           :name => (list.slice!(0...-2)).join(' '),
           :type => (list.slice!(-2)),
           :dir => (list.slice!(-1))}
        else
          h = {:address => list[0..-1], :flag => true}
        end
      else
        h = {:address => list, :flag => true}
      end
    end
  end
end