class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all.order(:created_at)
  end
end
