class Page < ApplicationRecord
  belongs_to :user
  has_many :followings
  has_many :comments

  def num_followers
    followings.count
  end
end
