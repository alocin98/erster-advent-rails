class Product < ApplicationRecord
  belongs_to :user, optional: true
  has_many :orders, dependent: :destroy

  attribute :images_of_product, :json, default: []
  attribute :sizes, :json, default: []

  validates :title, :description, :price, :main_product_image, :delievry_time, presence: true

  def image_gallery
    Array(images_of_product)
  end

  def size_options
    Array(sizes)
  end
end
