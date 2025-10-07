class User < ApplicationRecord
  include PgSearch::Model
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_one :business, dependent: :destroy
  has_one :payment, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :customer_orders, class_name: "Order", foreign_key: :id_of_user, inverse_of: :customer, dependent: :destroy
  has_many :received_orders, through: :products, source: :orders

  validates :role, inclusion: { in: [ 0, 1, 2 ] }

  scope :active, -> { where(deleted: false) }


  pg_search_scope :search,
    against: :email,
    using: {
      tsearch: { prefix: true, dictionary: "simple" }, # full-text, matches prefixes
      trigram: { threshold: 0.2 }                       # typo tolerance
    }

  def role_name
    case role
    when 0 then "User"
    when 1 then "Admin"
    when 2 then "Superadmin"
    else "Unknown"
    end
  end

  def user?       = role == 0
  def admin?      = role == 1
  def superadmin? = role == 2

  def adminish? = admin? || superadmin?
end
