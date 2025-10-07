class Admin::BaseController < ApplicationController
  before_action :require_admin!

  layout "admin"

  private

  def require_admin!
    unless current_user&.adminish?
      redirect_to root_path, alert: "Not authorized"
    end
  end
end
