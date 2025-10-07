class Admin::TransactionRequestsController < Admin::BaseController
  def index
    scope = Payment.includes(:user).where(is_verified: ["Pending", "pending", ""])
    scope = scope.order(created_at: :desc)
    @pagy, @payments = pagy(scope, items: params[:per]&.to_i || 25)
  end
end
