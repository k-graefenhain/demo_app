# By using the symbol ':user', we get Factory Girl to simulate the User model.
FactoryGirl.define do
  factory :user do |user|
    user.name "Michael Hartl"
    user.email "mhartl@example.com"
    user.password "foobar"
    user.password_confirmation "foobar"
  end
end

# syntax changed, see https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
FactoryGirl.define do
  sequence :email do |n|
    "person-#{n}@example.com"
  end
end