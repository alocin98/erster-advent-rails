class Admin::ProductsController < Admin::BaseController
  def index
    @q = params[:q].to_s.strip
    scope = Product.includes(:user)
    scope = scope.where("title ILIKE ?", "%#{@q}%") if @q.present?
    scope = scope.order(created_at: :desc)
    @pagy, @products = pagy(scope, items: params[:per]&.to_i || 30)
  end
end
