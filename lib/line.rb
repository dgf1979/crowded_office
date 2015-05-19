class Line < ActiveRecord::Base
  belongs_to :order
  has_one :supply

  before_save(:check_quantity)

private

  define_method(:check_quantity) do
    if self.quantity == nil || self.quantity <= 0
      self.quantity = 1
    end
  end
end
