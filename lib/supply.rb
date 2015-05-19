class Supply < ActiveRecord::Base
  belongs_to :order

  validates :name, presence: true, uniqueness: true

  before_save(:check_price)

  private

    define_method(:check_price) do
      if self.unit_price == nil || self.unit_price <= 0
        self.unit_price = 1.0
      end
    end
end
