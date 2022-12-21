puts "🌱 Seeding comics..."

review_bodies = ['"Absolutely stunning from start to finish!" - Mathew Murdoc',
                '"Forgetable." - Anthony Stark', 
                '"It was alright" - Wanda Maximoff', 
                '"A must read!" - Peter P.',
                '"Not worth it at all, I want my money back" - Bruce Banner',
                '"Poetic and delicatly insightful" - Frank Castle']

Comic.create(name: 'Mr. Freeze Goes To The Caribean')
Comic.create(name: 'Clayface Takes A Spa Day')
Comic.create(name: 'Wonder Woman in Atlantis')
Comic.create(name: 'Batgirl Faces Off Against Braniac')
Comic.create(name: 'Green Lantern Fights Sinestro...Again')
Comic.create(name: 'The Flash And The Mysterious Football')

Comic.all.each do |comic|
    rand(1..3   ).times do 
        Review.create(body: review_bodies.sample, rating: rand(1..4), comic_id: comic.id)
    end
end

puts "✅ Done seeding!"
  