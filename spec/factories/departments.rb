FactoryGirl.define do
  factory :department do
    sequence(:code) { |n| "department_%02d" % n }
    name { code.camelize }
    started_on { 2.years.ago }
  end
end
