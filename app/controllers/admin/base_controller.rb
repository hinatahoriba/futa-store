class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: Rails.application.credentials.dig(:admin, :name) || ENV["ADMIN_USER"] || "admin",
                               password: Rails.application.credentials.dig(:admin, :password) || ENV["ADMIN_PASSWORD"] || "admin"
end
