class Track < ActiveRecord::Base
  attr_accessible :album_id, :name, :is_bonus, :lyrics

  belongs_to(
      :album,
      :class_name => "Album",
      :foreign_key => :album_id,
      :primary_key => :id
      )

  has_one(
    :band,
    :through => :album,
    :source => :band
    )

  has_many( :notes,
    :class_name => "Note",
    :foreign_key => :track_id,
    :primary_key => :id
    )
end
