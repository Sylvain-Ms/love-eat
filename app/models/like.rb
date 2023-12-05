class Like < ApplicationRecord
  belongs_to :user
  belongs_to :user_liked, class_name: "User", foreign_key: 'user_liked_id'

  scope :match, -> (user) do
    find_by_sql("SELECT DISTINCT l.user_id, l.user_liked_id, ul.user_id, ul.user_liked_id
      FROM likes l JOIN likes ul ON l.user_liked_id = ul.user_id
      WHERE l.user_id = ul.user_liked_id AND l.user_id = #{user.id}")
  end

  def match?(current_user, user_liked)
    self.user_liked == user_liked && user_liked.likes.find_by(user_liked: current_user)
  end
end
