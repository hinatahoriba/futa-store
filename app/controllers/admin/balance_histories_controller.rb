class Admin::BalanceHistoriesController < Admin::BaseController
  def index
    @balance_histories = UserBalance.income
                                    .includes(:user)
                                    .order(created_at: :desc)
  end
end
