%w(robot automobile ship).each do |code|
  Department.create!(
    code: code,
    seq_number: 1,
    name: code.capitalize,
    established_on: 2.years.ago
  )
end

%w(alpha bravo).each do |code|
  Product.create!(
    code: code,
    model_number: 2012,
    department_code: "robot",
    department_seq_number: 1,
    name: code.capitalize,
    description: ""
  )
end
