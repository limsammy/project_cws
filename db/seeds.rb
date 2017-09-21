# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include ApplicationHelper


# 1.time do
#   Address.create!(
#     line_1: Faker::Address.street_name,
#     line_2: Faker::Address.street_address,
#     country: Faker::Address.country,
#     state: Faker::Address.state,
#     zip: Faker::Address.zip,
#     city: Faker::Address.city
#   )
# end
if User.count == 0
  10.times do
    user = User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: '11111111',
      password_confirmation: '11111111'
    )
    user.address = Address.create!(
      line_1: Faker::Address.street_name,
      line_2: Faker::Address.street_address,
      country: Faker::Address.country,
      state: Faker::Address.state,
      zip: Faker::Address.zip,
      city: Faker::Address.city
    )
  end
end

if Company.count == 0
  10.times do
    Company.create!(
      name: Faker::Company.name,
      phone_number: Faker::Number.number(10),
      department: Faker::Company.profession,
      fax: Faker::Company.ein
    )
  end
end

if Product.count == 0
  10.times do
    Product.create!(
      name: Faker::Food.dish,
      price: Faker::Number.decimal(2),
      code: SecureRandom.hex(16).upcase,
      stock_in_hand: Faker::Number.between(1, 10),
    )
  end
end

if Client.count == 0
  10.times do
    client=Client.create!(
      name: Faker::Name.first_name,
      email: Faker::Internet.email,
      mob_number: Faker::Number.number(10),
      company_id: Company.first.id
    )
    client.address = Address.create!(
      line_1: Faker::Address.street_name,
      line_2: Faker::Address.street_address,
      country: Faker::Address.country,
      state: Faker::Address.state,
      zip: Faker::Address.zip,
      city: Faker::Address.city
    )
  end
end

if Order.count == 0
  10.times do
    order = Order.create!(
      order_number: order_number,
      description: Faker::Commerce.product_name,
      company_id: Client.first.company_id,
      company_id: Client.first.id,
      ordered_at: DateTime.now
    )
    order.shipping_address = Address.create!(
      line_1: Faker::Address.street_name,
      line_2: Faker::Address.street_address,
      country: Faker::Address.country,
      state: Faker::Address.state,
      zip: Faker::Address.zip,
      city: Faker::Address.city
    )
  end
end

if Order.count == 0
  Order.all.each do |order|
    10.times do
      OrderItem.create!(
        quantity: 1,
        order_id: order.id,
        product_id: Product.first.id,
        amount: Product.first.price * 1,
        unit_price: Product.first.price
      )
    end
  end
end
