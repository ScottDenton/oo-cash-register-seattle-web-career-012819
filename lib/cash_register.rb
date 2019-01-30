require 'pry'
class CashRegister

  attr_accessor :total, :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_item_price = 0
  end

  def add_item(title, price, quantity = 1)
    self.total += quantity * price
    quantity.times {@items << title}
    @last_item_price = quantity * price
  end

  def apply_discount
    return "There is no discount to apply." if self.discount == 0
    self.total = self.total * ((100 - self.discount.to_f)/100)
    return "After the discount, the total comes to $#{self.total.to_i}."
  end

def void_last_transaction
  self.total -= @last_item_price
end


end

# c1 = CashRegister.new
#
# c1.add_item("macbook" , 1000)
#
# c1.apply_discount
# binding.pry
