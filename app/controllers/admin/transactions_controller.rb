class Admin::TransactionsController < Admin::BaseController
  def index
    scope = Payment.includes(:user)
    scope = scope.order(created_at: :desc)
    @pagy, @payments = pagy(scope, items: params[:per]&.to_i || 25)
  end
end
