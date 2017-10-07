FactoryGirl.define do
  factory :user do
    
    sequence :email do |i|
    	"email#{i}@mail.com"
    end

    sequence :password do |i|
    	"password#{i}"
    end
  end
end
