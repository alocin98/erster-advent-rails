class Payment < ApplicationRecord
  STATUSES = %w[Pending pending approved rejected].freeze

  belongs_to :user

  validates :payment_image, presence: true
  validates :is_verified, inclusion: { in: STATUSES }, allow_blank: true
end
