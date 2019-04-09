10.times do |n|
  Article.create!(
    title: "My Article #{n}",
    content: "lorem ipsum dolor sid tantum eranum sit#{n}",
    slug: "my-article-#{n}"
  )
end
