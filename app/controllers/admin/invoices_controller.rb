class Admin::InvoicesController < Admin::BaseController
  def show
    @recent_orders = Order.includes(:product, :customer).order(created_at: :desc).limit(10)
  end
end
