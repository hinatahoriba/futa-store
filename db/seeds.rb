# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Creating seed data..."

# ユーザー作成
user = User.find_or_create_by!(student_id: "S12345") do |u|
  u.name = "テストユーザー"
  u.balance = 5000
end
puts "Created user: #{user.name} (#{user.student_id})"

# 商品1: コーヒー
item1 = Item.find_or_create_by!(name: "コーヒー")
Price.find_or_create_by!(item: item1, price: 150)
Supplement.find_or_create_by!(item: item1, quantity: 20)
puts "Created item: #{item1.name}"

# 商品2: お茶
item2 = Item.find_or_create_by!(name: "お茶")
Price.find_or_create_by!(item: item2, price: 100)
Supplement.find_or_create_by!(item: item2, quantity: 30)
puts "Created item: #{item2.name}"

# 商品3: エナジードリンク
item3 = Item.find_or_create_by!(name: "エナジードリンク")
Price.find_or_create_by!(item: item3, price: 200)
Supplement.find_or_create_by!(item: item3, quantity: 15)
puts "Created item: #{item3.name}"

# 入金履歴を追加
UserBalance.find_or_create_by!(user: user, value: 5000, balance_type: :income)
puts "Created user balance record"

puts "Seed data created successfully!"
