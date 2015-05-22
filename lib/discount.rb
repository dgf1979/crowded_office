class Discount
  define_singleton_method(:calculate) do |quantity, unit_price|
    discounted_unit_price = unit_price
    if quantity >= 1000 # 50% off
      discounted_unit_price *= 0.5
    elsif quantity >= 200 # 40% off
      discounted_unit_price *= 0.6
    elsif quantity >= 100 # 30% off
      discounted_unit_price *= 0.7
    elsif quantity >= 50 # 20% off
      discounted_unit_price *= 0.8
    elsif quantity >= 20 # 10% off
      discounted_unit_price *= 0.9
    end
    return discounted_unit_price
  end
end
