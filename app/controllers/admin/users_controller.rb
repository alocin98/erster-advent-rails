class Admin::UsersController < Admin::BaseController
  def index
    @q = params[:q].to_s.strip
    scope = @q.present? ? User.search(@q) : User.all
    scope = scope.includes(:business)
    scope = scope.active.order(id: :asc)
    @pagy, @users = pagy(scope, items: params[:per]&.to_i || 20)
  end
  def show
    @user = User.find(params[:id])
  end

  def impersonate
    user = User.find(params[:id])

    if user.deleted?
      redirect_to admin_user_path(user), alert: "Dieser Benutzer ist deaktiviert und kann nicht angemeldet werden.", status: :see_other and return
    end

    if user == current_user
      redirect_to admin_user_path(user), notice: "Sie sind bereits als dieser Benutzer angemeldet.", status: :see_other and return
    end

    session[:admin_impersonator_id] = current_user.id
    sign_in(:user, user)
    redirect_to app_mystore_path, notice: "Sie sind jetzt als #{user.email} angemeldet.", status: :see_other
  end

  def destroy
    @user = User.find(params[:id])

    if @user == current_user
      redirect_to admin_users_path, alert: "Sie können sich nicht selbst löschen.", status: :see_other and return
    end

    if @user.update(deleted: true)
      redirect_to admin_users_path, notice: "Benutzer wurde gelöscht.", status: :see_other
    else
      redirect_to admin_users_path, alert: "Benutzer konnte nicht gelöscht werden.", status: :see_other
    end
  end
end
