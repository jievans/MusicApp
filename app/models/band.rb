class Band < ActiveRecord::Base
  attr_accessible :name

  has_many :albums,
          :class_name => "Album",
          :foreign_key => :band_id,
          :primary_key => :id

  has_many :tracks,
  :through => :albums,
  :source => :tracks

  validates :name, :presence => true, :uniqueness => true
end
