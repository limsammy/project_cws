# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include ApplicationHelper

if User.count == 0
  10.times do |f|
  puts "Creating user #{f}"
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

if Customer.count == 0
  10.times do |f|
  puts "Creating Customer #{f}"
    Customer.create!(
      name: Faker::Company.name,
      phone_number: Faker::Number.number(10),
      department: "Developer",
      fax: Faker::Number.number(10)
    )
  end
end

if Category.count == 0
  10.times do |f|
  puts "Creating category #{f}"
    Category.create!(
      name: Faker::Dessert.variety,
      item_code: Faker::Number.number(10),
      cover_slip: Faker::Dessert.topping,
      note: Faker::Dessert.flavor
    )
  end
end

if Product.count == 0
  Category.all.each do |category|
    10.times do |f|
      puts "Creating category for product #{f}"
      Product.create!(
        name: Faker::Food.dish,
        price: Faker::Number.decimal(2),
        code: SecureRandom.hex(16).upcase,
        stock_in_hand: Faker::Number.between(1, 10),
        category_id: category.id
      )
    end
  end
end

if Contact.count == 0
  10.times do |f|
    puts "Creating contact#{f}"
    contact=Contact.create!(
      name: Faker::Name.first_name,
      email: Faker::Internet.email,
      mob_number: Faker::Number.number(10),
      customer_id: Customer.first.id,
      created_at: (rand*10).days.ago
    )
    contact.address = Address.create!(
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
  10.times do |f|
    puts "Creating order #{f}"
    id = Contact.find(rand(Contact.count)).id
    if id == 0
      id += 1
    end
    order = Order.create!(
      order_number: order_number,
      description: Faker::Commerce.product_name,
      customer_id: Customer.first.id,
      created_at: (rand*10).days.ago,
      ordered_at: (rand*10).days.ago,
      updated_at: (rand*10).days.ago,
      contact_id: id
    )
    order.shipping_address = Address.create!(
      line_1: Faker::Address.street_name,
      line_2: Faker::Address.street_address,
      country: Faker::Address.country,
      state: Faker::Address.state,
      zip: Faker::Address.zip,
      city: Faker::Address.city,
      created_at: (rand*10).days.ago,
      updated_at: (rand*10).days.ago
    )
  end
end

if OrderItem.count == 0
  Order.all.each do |order|
    10.times do |f|
      puts "Creating orderitem #{f}"
      OrderItem.create!(
        quantity: 1,
        order_id: order.id,
        product_id: Product.first.id,
        amount: Product.first.price * 1,
        unit_price: Product.first.price,
        created_at: (rand*10).days.ago,
        updated_at: (rand*10).days.ago
      )
    end
  end
end

if !User.find_by(email: 'admin@admin.com')
  puts "Creating admin"
  User.create!(email: 'admin@admin.com', password: 'password')
end
