date = Date.new(2010, 1, 1)

%w(robot automobile ship).each do |code|
  Department.create!(
    code: code,
    name: code.capitalize,
    started_on: date,
    ended_on: nil
  )
end

%w(alpha bravo).each_with_index do |code, index|
  Product.create!(
    code: code,
    started_on: date.advance(years: index),
    ended_on: code == "alpha" ? date.advance(years: 1) : nil,
    department_code: "robot",
    name: code.capitalize,
    description: ""
  )
end
