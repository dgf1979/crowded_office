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

    private

    define_method(:check_order) do
      if self.order == nil || self.order <= 0
        self.order = 1
  end
end
