song_seeds = [
  {
    title: "The Trooper",
    artist_name: "Iron Maiden",
    release_year: 1988,
    genre: "Metal"
  },
  {
    title: "666 The Number of the Beast",
    artist_name: "Iron Maiden",
    release_year: 1987,
    genre: "Metal"
  },
  {
    title: "Smells Like Teen Spirit",
    artist_name: "Nirvana",
    release_year: 1993,
    genre: "Grunge Rock"
  },
  {
    title: "St. Anger",
    artist_name: "Metallica",
    release_year: 2008,
    genre: "Metal"
  },
  {
    title: "Harlem World",
    artist_name: "Mase",
    release_year: 2001,
    genre: "Rap"
  },
]

song_seeds.each do |song|
  Song.create(song)
end