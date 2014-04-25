# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  album_id   :integer          not null
#  lyrics     :text
#  bonus      :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base

  belongs_to :album

end
