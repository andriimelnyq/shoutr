class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true

  has_many :shouts, dependent: :destroy
  has_many :likes
  has_many :liked_shouts, through: :likes, source: :shout
  
  has_many :shouts, dependent: :destroy

  def like(shout)
    liked_shouts << shout
  end

  def unlike(shout)
    liked_shouts.destroy(shout)
  end

  def liked?(shout)
    liked_shout_ids.include?(shout.id)
  end
end
