class HomeController < ApplicationController
  def index
  end

  def search
    Rails.logger.info "Search params: #{params.inspect}"
    student_id = params[:student_id]&.tr("０-９", "0-9")&.strip
    Rails.logger.info "Searching for student_id: '#{student_id}'"
    
    user = User.find_by(student_id: student_id)
    Rails.logger.info "User found: #{user.inspect}"

    if user
      redirect_to user_items_path(user)
    else
      flash.now[:alert] = "学生番号が見つかりません"
      render :index, status: :not_found
    end
  end
end
