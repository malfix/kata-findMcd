class Exercise
  def find_multiple(*list)
    intersection_mcd = find_single_mdc(list.pop) # ottimizzazione
    list.each do |number|
      intersection_mcd = intersect_mcd(find_single_mdc(number), intersection_mcd)
      break if intersection_mcd.size == 0 # ottimizzazione
    end
    map_to_integer(intersection_mcd)
  end

  def find_single_mdc(number)
    mcd = {}
    current_divisor = 2
    while current_divisor <= number
      if  number % current_divisor == 0
        mcd[current_divisor.to_s] = (mcd[current_divisor.to_s] || 0) + 1
        number = number / current_divisor
      else
        current_divisor += 1 # TODO: Ottimizzare, vengono effettuate più divisioni del necessario
      end
    end
    mcd
  end

  def intersect_mcd(mcd1, mcd2)
    shortest_mcd, longest_mcd = [mcd1, mcd2].sort_by{|el| el.size} # ottimizzazione
    result_mcd = {}
    shortest_mcd.each do |k,v|
      if longest_mcd[k]
        result_mcd[k] = [shortest_mcd[k], longest_mcd[k]].min
      end
    end
    result_mcd
  end

  def map_to_integer(map)
    tot = 1
    map.each do |k,v|
      tot *= k.to_i * v
    end
    tot
  end
end
