class Micropost < ActiveRecord::Base
  MICROPOSTS_PER_VIEW = 10
  attr_accessible :content
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  default_scope order: 'microposts.created_at DESC'

  def self.from_users_followed_by(user)
    # avoid N+1 queries problem
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id).includes(:user)
  end

  def self.limit_offset(view)
    limit(MICROPOSTS_PER_VIEW).offset(view * MICROPOSTS_PER_VIEW)
  end
  
end
