class User < ApplicationRecord
  has_many :comments
  has_many :pages
  has_many :followings

  def follow(page_id)
    return if Following.where(user_id: id, page_id: page_id).any?
    Following.create(:user_id => id, :page_id => page_id)
  end
end
