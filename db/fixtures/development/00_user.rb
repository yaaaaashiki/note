10.times do |i|
  i += 1

  User.seed do |u| 
  u.id = i
  #user_name はアルファベット入力で
  u.name = %w(user shinohara kaga matsuo
                minamoto sugita katsuyama ootomo yamamoto ishihara)[i - 1]
  u.email = "test_seed#{i}@email.com" 
  u.password = "password"
  u.created_at = DateTime.current
  u.updated_at = DateTime.current
  u.joinyear = 2016 
  u.role = 1
  u.status = 1 
  end
end

