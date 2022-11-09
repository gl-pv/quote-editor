class Quote < ApplicationRecord
  has_many :line_item_dates, dependent: :destroy
  has_many :line_items, through: :line_item_dates
  belongs_to :company

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  after_create_commit ->(quote) { broadcast_prepend_later_to [quote.company, "quotes"] }
  after_update_commit ->(quote) { broadcast_replace_later_to [quote.company, "quotes"] }
  after_destroy_commit ->(quote) { broadcast_remove_to [quote.company, "quotes"] }

  def total_price
    line_items.sum(&:total_price)
  end
end
