# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  band_id    :string(255)      not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base

  belongs_to :band
  has_many :tracks, dependent: :destroy

end
