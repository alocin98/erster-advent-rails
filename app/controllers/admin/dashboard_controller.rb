class Admin::DashboardController < Admin::BaseController
  def index
    @metrics = {
      Benutzer: User.count,
      Geschäfte: Business.count,
      Bestätigte_Geschäfte: Business.confirmed.count,
      Wartende_Geschäfte: Business.pending.count
    }

    @recent_businesses = Business.includes(:user).pending.order(created_at: :desc).limit(5)
  end
end
