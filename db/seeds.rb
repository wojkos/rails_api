providers = %w[github facebook gmail tweeter]
user_no = 5

user_no.times do |i|
  User.create(
    login: "#{Faker::Internet.user_name}#{i}",
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    url: 'http://example.com',
    avatar_url: 'http://example.com/avatar',
    provider: providers.sample.to_s
  )
end
print(User.all)
10.times do |n|
  Article.create(
    title: "My Article #{n}",
    content: "lorem ipsum dolor sid tantum eranum sit#{n}",
    slug: "my-article-#{n}",
    user_id: (1..user_no).to_a.sample.to_s
  )
  comments_no = (0..6).to_a.sample
  comments_no.times do |_comment|
    Comment.create(
      content: Faker::TvShows::Community.quotes.to_s,
      article_id: (n + 1).to_s,
      user_id: (1..user_no).to_a.sample.to_s
    )
  end
end
