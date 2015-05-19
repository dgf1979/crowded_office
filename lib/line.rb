class Line < ActiveRecord::Base
  belongs_to :order
  has_one :supply
end
