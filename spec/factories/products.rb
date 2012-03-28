FactoryGirl.define do
  factory :product do
    sequence(:code) { |n| "product_%02d" % n }
    name { code.camelize }
    started_on { 2.years.ago }
    ended_on { nil }
    department_code do |p|
      FactoryGirl.create(:department,
        started_on: p.started_on, ended_on: p.ended_on).code
    end
  end
end
