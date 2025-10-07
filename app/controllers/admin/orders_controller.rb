class Admin::OrdersController < Admin::BaseController
  def index
    scope = Order.includes(:product, :customer)
    scope = scope.order(created_at: :desc)
    @pagy, @orders = pagy(scope, items: params[:per]&.to_i || 30)
  end
end
