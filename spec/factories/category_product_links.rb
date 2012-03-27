FactoryGirl.define do
  factory :category_product_link do
    started_on { 2.years.ago }
    ended_on { nil }
    category_code do |link|
      FactoryGirl.create(:category,
        started_on: link.started_on, ended_on: link.ended_on).code
    end
    product_code do |link|
      FactoryGirl.create(:product,
        started_on: link.started_on, ended_on: link.ended_on).code
    end
  end
end
