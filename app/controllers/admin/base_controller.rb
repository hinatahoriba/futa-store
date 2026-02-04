class Admin::BaseController < ApplicationController
  layout "admin"
  http_basic_authenticate_with name: Rails.application.credentials.dig(:admin, :name) || ENV["ADMIN_USER"],
  password: Rails.application.credentials.dig(:admin, :password) || ENV["ADMIN_PASSWORD"]
end
