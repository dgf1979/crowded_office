class Order < ActiveRecord::Base
  require 'date'
  belongs_to :company
  has_many :lines
  validates :company_id, presence: true
  validates :month_id, presence: true
  validates :month_id, :inclusion => { :in => 1..12 }

  alias_attribute :month, :month_id

  def month_name
    return Date::MONTHNAMES[self.month_id]
  end
end
