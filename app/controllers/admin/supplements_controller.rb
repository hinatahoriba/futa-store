class Admin::SupplementsController < Admin::BaseController
  before_action :set_item

  def new
    @supplement = @item.supplements.build
  end

  def create
    @supplement = @item.supplements.build(supplement_params)
    if @supplement.save
      redirect_to admin_items_path, notice: "在庫を補填しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def supplement_params
    params.require(:supplement).permit(:quantity)
  end
end
