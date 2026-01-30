module Users
  class ChargesController < ApplicationController
    def new
      @user = User.find(params[:user_id])
    end

    def create
      @user = User.find(params[:user_id])
      amount = (params[:preset_amount].presence || params[:amount]).to_i

      if amount <= 0
        flash.now[:alert] = "金額は1円以上を入力してください"
        render :new, status: :unprocessable_entity
        return
      end

      begin
        ActiveRecord::Base.transaction do
          # 残高を加算
          @user.balance += amount
          @user.save!

          # 入金履歴を作成
          @user.user_balances.create!(
            value: amount,
            balance_type: :income
          )
        end

        flash[:success] = "チャージが完了しました"
        redirect_to user_items_path(@user)
      rescue StandardError => e
        flash.now[:alert] = "チャージに失敗しました: #{e.message}"
        render :new, status: :unprocessable_entity
      end
    end
  end
end
