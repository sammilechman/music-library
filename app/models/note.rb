# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  track_id   :integer          not null
#  text       :text             not null
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)      not null
#

class Note < ActiveRecord::Base

  belongs_to :user
  belongs_to :track

  validates :user_id, :track_id, :text, :title, presence: true

end
