class Page < ApplicationRecord
  belongs_to :user
  has_many :followings

  def num_followers
    followings.countn
  end
end
