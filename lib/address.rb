$:.unshift File.expand_path('../lib', __FILE__)

TYPES = %w(ST RD AV AVE WY WAY CT PL)
DIRS = %w(N S E W SE SW)

class Address

  attr_reader :number, :name, :suffix, :type, :direction, :flag

  def initialize(addr_string)
    list = addr_string.upcase.split(' ')
    if DIRS.include?(list[1])
      if list[2] =~ /\d{1,3}[a-z]{2}/i
        h = {:number => list.shift.to_i,
             :dir => list.shift,
             :name => list[0][0...(/\D/ =~ list[0])],
             :suffix => list[0][(/\D/ =~ list.shift)..-1],
             :type => list.shift}
      elsif TYPES.include?(list[-1])
        h = {:number => list.shift.to_i,
             :dir => list.shift,
             :name => (list.slice!(0...-1)).join(' '),
             :type => list.shift}
      else
        h = {:address => list, :flag => true}
      end
    elsif list[1] =~ /\d{1,3}[a-z]{2}/i
      h = {:number => list.shift.to_i,
           :name => list[0][0...(/\D/ =~ list[0])],
           :suffix => list[0][(/\D/ =~ list.shift)..-1],
           :type => list.shift,
           :dir => list.shift}
    elsif DIRS.include?(list[-1])
      if TYPES.include?(list[-2])
        h = {:number => list.shift.to_i,
             :name => (list.slice!(0...-2)).join(' '),
             :type => (list.slice!(-2)),
             :dir => (list.slice!(-1))}
      else
        h = {:address => list[0..-1], :flag => true}
      end
    else
      h = {:address => list, :flag => true}
    end

    h[:flag] = true if h.has_value?(nil)

  @number = h[:number]
  @name = h[:name]
  @suffix = h[:suffix]
  @type = h[:type]
  @direction = h[:direction]
  @flag = h[:flag]
  @direction = h[:dir]
  @addr_hash = h
  end

  def view
    "#{@addr_hash}"
  end

end
