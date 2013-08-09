class Note < ActiveRecord::Base
  attr_accessible :body, :track_id
  validates :body, :presence  => true

  belongs_to(:track,
  :class_name => "Track",
  :primary_key => :id,
  :foreign_key => :track_id
  )
end
