module Users
  class PurchasesController < ApplicationController
    def create
      @user = User.find(params[:user_id])
      @item = Item.find(params[:item_id])
      quantity = params[:quantity].to_i
      quantity = 1 if quantity <= 0

      begin
        ActiveRecord::Base.transaction do
          # 価格情報の取得 (楽観ロックなどは今回は考慮しないが、最新価格を取得)
          current_price = @item.current_price
          unless current_price
            raise StandardError, "価格情報が見つかりません"
          end

          total_price = current_price.price * quantity

          # 在庫確認
          if @item.stock_quantity < quantity
            raise StandardError, "在庫が不足しています"
          end

          # 残高確認
          if @user.balance < total_price
            raise StandardError, "残高が不足しています"
          end

          # 残高を減らす
          @user.balance -= total_price
          @user.save!

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
        end

        flash[:success] = "購入が完了しました"
      rescue StandardError => e
        flash[:alert] = e.message
      end

      redirect_to user_items_path(@user)
    end
  end
end
