module Users
  class ItemsController < ApplicationController
    before_action :set_user

    def index
      @items = Item.includes(:prices, :supplements, :user_items).all
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end
