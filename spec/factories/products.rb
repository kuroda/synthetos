FactoryGirl.define do
  factory :product do
    sequence(:code) { |n| "product_%02d" % n }
    name { code.camelize }
    started_on { 2.years.ago }
    ended_on { nil }
  end
end
