class Order < ActiveRecord::Base
  belongs_to :company
  has_one :month
  has_many :lines
end
