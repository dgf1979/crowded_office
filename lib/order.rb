class Order < ActiveRecord::Base
  belongs_to :company
  #has_one :month
  has_many :lines
  validates :company_id, presence: true
  validates :month_id, presence: true
  validates :month_id, :inclusion => { :in => 1..12 }
end
