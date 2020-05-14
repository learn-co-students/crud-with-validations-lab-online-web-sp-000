test_attributes_1 = {
    :title => "99 Problems",
    :released => true,
    :release_year => 2003,
    :artist_name => "Jay-Z",
    :genre => "Rap"
}

test_attributes_2 = {
    :title => "Lose Yourself",
    :released => true,
    :release_year => 2002,
    :artist_name => "Eminem",
    :genre => "Rap"
}

Song.create(test_attributes_1)
Song.create(test_attributes_2)