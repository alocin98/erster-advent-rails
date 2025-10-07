class Admin::EmailsController < Admin::BaseController
  def index
    @verified_users = User.where(is_verified: true)
    @pending_payments = Payment.where(is_verified: ["Pending", "pending", ""])
  end
end
