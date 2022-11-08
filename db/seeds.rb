puts "🌱 Seeding spices..."

review_bodies = ['"Absolutely stunning from start to finish!" - Samuel Wellington',
                '"Forgetable." - The Bored Comic Enthusiast', 
                '"It was alright" - Ashley Monighan', 
                '"A must read!" - Jenny Havlock',
                '"Not worth it at all, I want my money back" - JeromeReviewsComics_232',
                '"Not the best but worth a read" - Iron Hull Comics']

Comic.create(name: 'Spiderman goes to the Caribean')
Comic.create(name: 'Hulk takes a nap')
Comic.create(name: 'Wonder Woman in Atlantis')
Comic.create(name: 'Ms. Marvel faces off against Braniac')
Comic.create(name: 'Green Lantern fights Sinestro...again')
Comic.create(name: 'Daredevil and the mysterious football')

Comic.all.each do |comic|
    1.times do 
        Review.create(body: review_bodies.sample, rating: rand(1..4), comic_id: comic.id)
    end
end

puts "✅ Done seeding!"
