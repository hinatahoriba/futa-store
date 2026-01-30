class Admin::PurchaseHistoriesController < Admin::BaseController
  def index
    @purchase_histories = UserItem
      .includes(:user, :item, :price)
      .order(created_at: :desc)
  end
end
