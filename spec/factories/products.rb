FactoryGirl.define do
  factory :product do
    sequence(:code) { |n| "product_%02d" % n }
    sequence(:model_number) { |n| n }
    name { code.camelize }
  end
end
