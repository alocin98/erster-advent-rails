class Admin::StoresController < Admin::BaseController
  before_action :load_business, only: [ :show, :update ]

  def index
    @q = params[:q].to_s.strip
    scope = Business.includes(:user)
    scope = scope.where("business_name ILIKE ?", "%#{@q}%") if @q.present?
    @pagy, @businesses = pagy(scope.order(:business_name), items: params[:per]&.to_i || 20)
  end

  def show
    @owner = @business.user
    status_options = Business.statuses.keys.map { |status| [ status.humanize, status ] }
    @images = [
      @business.main_image,
      @business.image_gallery1,
      @business.image_gallery2,
      @business.image_gallery3
    ].select(&:attached?)
  end

  def update
    if @business.update(business_params)
      redirect_to admin_store_path(@business), notice: "Geschäft wurde aktualisiert."
    else
      redirect_to admin_store_path(@business), alert: @business.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  private

  def load_business
    @business = Business.includes(:user).find_by(id: params[:id])
    return if @business

    redirect_to admin_stores_path, alert: "Store wurde nicht gefunden." and return
  end

    def business_params
    return {} unless params[:business]

    permitted = params.require(:business).permit(
      :status
    )

    permitted[:tags] = Array(permitted[:tags]).compact_blank
    permitted[:categories] = Array(permitted[:categories]).compact_blank
    permitted
  end
end
