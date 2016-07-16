module ApplicationHelper

  def price_to_s(price)
    if price >= 1
      "$#{number_with_precision(price, strip_insignificant_zeros: true)}"
    elsif price > 0
      "#{number_with_precision(price, precision: 2).sub(/^[0.]*/,"")}¢"
    elsif price != 0
      "#{price}"
    end
  end
end
