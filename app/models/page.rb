class Page < ApplicationRecord
  belongs_to :user
  has_many :followings

  def num_followers
    followings.count
  end
end
