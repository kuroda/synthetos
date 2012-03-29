FactoryGirl.define do
  factory :category do
    sequence(:code) { |n| "category_%02d" % n }
    name { code.camelize }
    started_on { 2.years.ago }
    ended_on { nil }
  end
end
