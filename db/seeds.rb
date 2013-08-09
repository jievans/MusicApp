

Band.create!(:name => "Eric Clapton")
Band.create!(:name => "Incubus")
Band.create!(:name => "Bush")

Album.create!(:name => "Leila and Other Assorted Love Songs", :band_id => 1)
Track.create!(:name  => "Leila", :album_id => 1)

Track.create!(:name  => "Cocaine", :album_id => 1)
Note.create!(:body => "I love Leila.", :track_id => 1)
Note.create!(:body => "I love this song that begins with C.", :track_id => 2)
