require 'faker'

25.times do
  Song.create(
    title: Faker::Music.album,
    released: [true, false].sample,
    release_year: Faker::Date.backward(200).to_s.first(4),
    artist_name: Faker::Music::RockBand.name,
    genre: Faker::Music.genre
  )
end
