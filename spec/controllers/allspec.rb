require 'rails_helper'

RSpec.describe SongsController, type: :controller do
  let(:valid_attributes) do
    {
      title: "Talisman",
      artist_name: "Air",
      release_year: 2007,
      released: true,
      genre: "Post-Rock"
    }
  end

  let(:invalid_attributes) do
    {
      title: nil,
      artist_name: nil,
      release_year: nil,
      released: true
    }
  end

  describe "basic listing, viewing and editing" do
    let(:song) { Song.create!(valid_attributes) }

    it "lists all songs" do
      get :index
      expect(assigns(:songs)).to eq([song])
    end

    it "views a single song" do
      get :show, params: { id: song.id }
      expect(assigns(:song)).to eq(song)
    end

    it "fetches a song for editing" do
      get :edit, params: { id: song.id }
      expect(assigns(:song)).to eq(song)
    end
  end

  context "creating a valid song" do
    before { post :create, params: { song: valid_attributes } }

    it "creates a new Song" do
      expect(Song.count).to eq(1)
    end

    it "assigns and persists new song" do
      expect(assigns(:song)).to be_a(Song)
      expect(assigns(:song)).to be_persisted
    end

    it "redirects to the created song" do
      expect(response).to redirect_to(Song.last)
    end
  end

  context "creating an invalid song" do
    before { post :create, params: { song: invalid_attributes} }

    it "has not been persisted" do
      expect(assigns(:song)).to be_new_record
    end

    it "re-renders the template" do
      expect(response).to render_template("new")
    end
  end

  context "updating a song with valid data" do
    let(:new_attributes) do
      { title: "Moon Safari" }
    end
    let(:song) { Song.create!(valid_attributes) }

    before do
      patch :update, params: { id: song.id, song: new_attributes }
    end

    it "updates the song" do
      song.reload
      expect(song.title).to eq("Moon Safari")
    end

    it "redirects to the song" do
      expect(response).to redirect_to(song)
    end
  end

  context "updating a song with invalid data" do
    let(:song) { Song.create!(valid_attributes) }
    before do
      patch :update, params: { id: song.id, song: invalid_attributes }
    end

    it "does not persist changes" do
      expect(song.title).to eq("Talisman")
    end

    it "re-renders the 'edit' template" do
      expect(response).to render_template("edit")
    end
  end

  context "destroying a song" do
    let(:song) { Song.create!(valid_attributes) }
    before do
      delete :destroy, params: { id: song.id }
    end

    it "destroys the requested song" do
      expect(Song.count).to eq(0)
    end

    it "redirects to the songs list" do
      expect(response).to redirect_to(songs_url)
    end
  end

end


require 'rails_helper'

RSpec.describe Song, type: :model do
  let(:valid_attributes) do
    {
      title: "Talisman",
      artist_name: "Air",
      release_year: 2007,
      released: true,
      genre: "Post-Rock"
    }
  end

  let(:missing_title) { valid_attributes.except(:title) }
  let(:missing_release_year) { valid_attributes.except(:release_year) }
  let(:unreleased) { missing_release_year.merge(released: false) }
  let(:future_release_year) { valid_attributes.merge(release_year: Date.today.year + 1) }

  it "is valid when expected" do
    expect(Song.new(valid_attributes)).to be_valid
  end

  it "is invalid without title" do
    expect(Song.new(missing_title)).to be_invalid
  end

  it "is invalid without release year when released is true" do
    expect(Song.new(missing_release_year)).to be_invalid
  end

  it "is valid without release year when released is false" do
    expect(Song.new(unreleased)).to be_valid
  end

  it "is invalid when the release year is in the future" do
    expect(Song.new(future_release_year)).to be_invalid
  end

  it "is invalid if an artist tries to release the same song twice in a year" do
    Song.create!(valid_attributes)
    expect(Song.new(valid_attributes)).to be_invalid
  end
end



RSpec.describe 'songs/edit', type: :feature do
    let(:song_attributes) do
      {
        title: 'Rhythms Which I Played',
        release_year: 2000,
        released: true,
        genre: 'Normcore',
        artist_name: 'Man With Instruments'
      }
    end
  
    let(:song) { Song.create!(song_attributes) }
  
    it 'renders the edit song form' do
      visit edit_song_path(song)
  
      form = find('form')
  
      expect(form[:action]).to eq(song_path(song))
      expect(form.find('input#song_title').value).to eq(song.title)
      expect(form.find('input#song_release_year').value).to eq(song.release_year.to_s)
      expect(form.find('input#song_released')).to be_checked
      expect(form.find('input#song_genre').value).to eq(song.genre)
      expect(form.find('input#song_artist_name').value).to eq(song.artist_name)
    end
  end

  
  RSpec.describe 'songs/index', type: :feature do
    let(:song_attributes_1) do
      {
        title: 'Rhythms Which I Played',
        release_year: 2000,
        released: true,
        genre: 'Normcore',
        artist_name: 'Man With Instruments'
      }
    end
  
    let(:song_attributes_2) do
      {
        title: 'Rhythms Which I Played Again at a Later Time',
        release_year: 2004,
        released: true,
        genre: 'Sci-Crust Fizz-Punk',
        artist_name: 'Man With Instruments'
      }
    end
  
    before { Song.create!([song_attributes_1, song_attributes_2]) }
  
    it 'renders a list of songs' do
      visit songs_path
      expect(all('tbody > tr').size).to eq(2)
    end
  end

  RSpec.describe 'songs/new', type: :feature do
    it 'renders form' do
      visit new_song_path
  
      form = find('form')
  
      expect(form.find('input#song_title')[:name]).to eq('song[title]')
      expect(form.find('input#song_release_year')[:name]).to eq('song[release_year]')
      expect(form.find('input#song_released')[:name]).to eq('song[released]')
      expect(form.find('input#song_genre')[:name]).to eq('song[genre]')
      expect(form.find('input#song_artist_name')[:name]).to eq('song[artist_name]')
    end
  end
  
  