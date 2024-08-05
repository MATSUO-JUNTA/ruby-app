# ユーザー5人作成
5.times do |i|
  User.create!(
    email: "user#{i+1}@example.com",
    password: "123456",
    password_confirmation: "123456"
  )
end

# ユーザーそれぞれに関連する投稿を5つ作成
User.all.each do |user|
  5.times do |i|
    user.posts.create!(
      title: "#{user.email}による#{i+1}番目の投稿です",
      body:  "#{user.email}による#{i+1}番目の本文です"
    )
  end
end
