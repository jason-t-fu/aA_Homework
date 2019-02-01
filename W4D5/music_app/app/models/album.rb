class Album < ApplicationRecord

  validates :title, :year, :band_id, presence: true
  validates :studio, inclusion: [true, false]

  belongs_to :band
end
