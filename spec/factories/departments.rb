FactoryGirl.define do
  factory :department do
    sequence(:code) { |n| "department_%02d" % n }
    sequence(:seq_number) { |n| n }
    name { code.camelize }
    established_on { 2.years.ago }
  end
end
