require 'rails_helper'

RSpec.describe Song, type: :model do
  it "is valid" do
    song = Song.new(title: "A song title", released: true, release_year: 1999, artist_name: "A person", genre: "pop")
    expect(song).to be_valid
  end

  it "is invalid with no title" do
    song = Song.new(released: true, release_year: 1999, artist_name: "A person", genre: "pop")
    expect(song).to be_invalid
  end

  it "is invalid because released must be a boolean value" do
    song = Song.new(title: "A song title", released: nil, release_year: 1999, artist_name: "A person", genre: "pop")
    expect(song).to be_invalid
  end

  it "is invalid with no release year if released is true" do
    song = Song.new(title: "A song title", released: true, artist_name: "A person", genre: "pop")
    expect(song).to be_invalid
  end

  it "is invalid if release year is later to the current year" do
    song = Song.new(title: "A song title", released: true, release_year: 2023, artist_name: "A person", genre: "pop")
    expect(song).to be_invalid
  end

  it "is invalid with no artist name" do
    song = Song.new(title: "A song title", released: true, release_year: 1999, genre: "pop")
    expect(song).to be_invalid
  end

end
