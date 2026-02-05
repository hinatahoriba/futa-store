module Users
  class PurchasesController < ApplicationController
    def create
      quantity = [params[:quantity].to_i, 1].max

      begin
        ActiveRecord::Base.transaction do
          # 悲観ロックを使用してユーザーとアイテムを取得
          @user = User.lock.find(params[:user_id])
          @item = Item.lock.find(params[:item_id])

          # 価格情報の取得
          current_price = @item.current_price
          raise StandardError, "価格情報が見つかりません" unless current_price

          total_price = current_price.price * quantity

          # 在庫確認
          raise StandardError, "在庫が不足しています" if @item.stock_quantity < quantity

          # 残高確認
          raise StandardError, "残高が不足しています" if @user.balance < total_price

          # 残高を減らす
          @user.update!(balance: @user.balance - total_price)

          # 支出履歴を作成
          @user.user_balances.create!(
            value: total_price,
            balance_type: :outcome
          )

          # 購入履歴を作成
          @user.user_items.create!(
            item: @item,
            price: current_price,
            quantity: quantity
          )

          # （必要なら）在庫数を減らす処理もここで行う
          # @item.update!(stock_quantity: @item.stock_quantity - quantity)
        end

        flash[:success] = "購入が完了しました"
      rescue StandardError => e
        flash[:alert] = e.message
      end

      redirect_to user_items_path(params[:user_id])
    end
  end
end
