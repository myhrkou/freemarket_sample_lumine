json.array! @vouchers do |voucher|
  json.id voucher.id
  json.name voucher.name
  json.code voucher.code
  json.price voucher.price
end