class App::AppController < App::BaseController
  def profile
    render template: "app/profile"
  end

  def payments
    render template: "app/payments"
  end

  def requests
    render template: "app/requests"
  end
end
