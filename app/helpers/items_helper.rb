module ItemsHelper
  def price_yen(price)
    price=price.delete("¥")
    price=price.delete(",")
    price=price.to_i
    price="¥#{price.to_s(:delimited)}"
  end
end