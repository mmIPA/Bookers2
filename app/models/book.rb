class Book < ApplicationRecord
  belongs_to :user
  has_many :notifications, as: :notifiable, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  
  after_create do
    user.followers.each do |follower|
      notifications.create(user_id: follower.id)
    end
  end  


end
