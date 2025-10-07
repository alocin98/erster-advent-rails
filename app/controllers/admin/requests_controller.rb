class Admin::RequestsController < Admin::BaseController
  def index
    @q = params[:q].to_s.strip
    scope = MoveRequest.all
    scope = scope.where(id: @q.to_i) if @q.match?(/\A\d+\z/)
    scope = scope.order(created_at: :desc)
    @pagy, @move_requests = pagy(scope, items: params[:per]&.to_i || 20)
  end
end
