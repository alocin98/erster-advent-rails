class Admin::SessionsController < ApplicationController
  layout "admin_login"

  def new
    return redirect_to admin_root_path if current_user&.adminish?
  end
end
