class Marketing::StoresController < Marketing::BaseController
  before_action :load_store, only: :show

  def index
    if params[:q].present?
      @businesses = Business.confirmed.search(params[:q])
    else
      @businesses = Business.confirmed
    end
  end

  def show
    @owner = @business.user
    @products = @owner ? @owner.products.order(created_at: :desc) : Product.none
    @images = [
      @business.main_image,
      @business.image_gallery1,
      @business.image_gallery2,
      @business.image_gallery3
    ].select(&:attached?)
  end

  private

  def load_store
    @business = Business.confirmed.includes(:user).find_by(id: params[:id])

    return if @business

    redirect_to marketing_stores_path, alert: "Store wurde nicht gefunden." and return
  end
end
