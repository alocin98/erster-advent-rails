class Business < ApplicationRecord
   include PgSearch::Model

  pg_search_scope :search, against: [ :business_name, :address ],
    associated_against: {
      rich_text_description: :body
    },
    using: {
      tsearch: { prefix: true }
    }
  belongs_to :user
  has_many :products, through: :user

  has_one_attached :main_image
  has_one_attached :image_gallery1
  has_one_attached :image_gallery2
  has_one_attached :image_gallery3

  has_rich_text :description
  has_rich_text :first_advent_specialities


  attribute :tags, :json, default: []
  attribute :categories, :json, default: []

  enum :status, [ :pending, :confirmed, :rejected, :deleted ], default: :pending
end
