class Page < ApplicationRecord
  belongs_to :user
  has_many :followings
end
