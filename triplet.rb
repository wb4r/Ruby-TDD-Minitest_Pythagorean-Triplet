class Triplet
  attr_reader :alfa, :bravo, :charlie

  def initialize(alfa, bravo, charlie)
    @alfa = alfa
    @bravo = bravo
    @charlie = charlie
  end

  def sum
    return alfa + bravo + charlie
  end

  def product
    return alfa * bravo * charlie
  end

  def pythagorean?
    return true if alfa ** 2 + bravo ** 2 == charlie ** 2
  end

  def self.where(delimeters)
    Triplets.new(delimeters).engine
  end
end


class Triplets
  attr_reader :delimeters

  def initialize(delimeters)
    @delimeters = delimeters
  end

  def engine
    define_delimeters
    find_Pythagorean_triplets_in_list(find_array_between_delimiters)
  end

  def define_delimeters
    if delimeters[:max_factor]  then @upper_limit = delimeters[:max_factor]  else @upper_limit = 1 end
    if delimeters[:min_factor]  then @lower_limit = delimeters[:min_factor]  else @lower_limit = 1 end
    if delimeters[:sum]         then @sum = delimeters[:sum]                 else @sum = false     end
  end

  def find_array_between_delimiters
    list = []
    for num in @lower_limit..@upper_limit do list << num end
    list.combination(3).to_a
  end

  def find_Pythagorean_triplets_in_list(array_bt_delimeters)
    triplets = []

    array_bt_delimeters.each do |alfa, bravo, charlie|
      candidate_for_triplet = Triplet.new(alfa, bravo, charlie)
      if @sum != false
        if candidate_for_triplet.pythagorean? == true && candidate_for_triplet.sum == @sum
          triplets << candidate_for_triplet
        end
      else
        if candidate_for_triplet.pythagorean? == true 
          triplets << candidate_for_triplet
        end
      end
    end
    triplets
  end
end