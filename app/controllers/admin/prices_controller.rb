class Admin::PricesController < Admin::BaseController
  before_action :set_item

  def new
    @price = @item.prices.build
  end

  def create
    @price = @item.prices.build(price_params)
    if @price.save
      redirect_to admin_items_path, notice: "価格を変更しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def price_params
    params.require(:price).permit(:price)
  end
end
