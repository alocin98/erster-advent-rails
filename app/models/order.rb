class Order < ApplicationRecord
  belongs_to :product
  belongs_to :customer, class_name: "User", foreign_key: :id_of_user, inverse_of: :customer_orders

  delegate :user, to: :product, prefix: true, allow_nil: true

  validates :quantity, :size, :order_no, :accept_order, presence: true
end
