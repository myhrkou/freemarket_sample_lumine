module ItemsHelper
  def price_yen(price)
    price = price.to_i
    price = "¥#{price.to_s(:delimited)}"
  end

  def fee(price)
    price = price * 0.1
    price = "¥#{price.floor}"
  end

  def benefit(price)
    tax = price * 0.1
    price = price-tax
    price = "¥#{price.floor}"
  end

end