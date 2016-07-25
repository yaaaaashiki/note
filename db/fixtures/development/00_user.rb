10.times do |i|
  i += 1

  User.seed do |u| 
  u.id = i
  u.name = %w(user 篠原梓 加賀広樹 松尾泰
                源大輔 杉田健 勝山基徳 大友玲奈 山本将英 石原真紀保)[i - 1]
  u.email = "test_seed#{i}@email.com" 
  u.password = "passward"
  u.created_at = DateTime.current
  u.updated_at = DateTime.current
  u.joinyear = 2016 
  u.role = 1
  u.status = 1 
  end
end

