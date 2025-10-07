class Marketing::PagesController < Marketing::BaseController
  def home
    @featured_products = Product.includes(:user).order(created_at: :desc).limit(4)
    @featured_businesses = Business.confirmed.includes(:user).order(created_at: :desc).limit(3)
  end

  def about
    @totals = {
      products: Product.count,
      businesses: Business.confirmed.count,
      orders: Order.count
    }
  end
end
