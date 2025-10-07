class App::BaseController < ApplicationController
  layout "app"
  def index
    render template: "app/home"
  end
end
