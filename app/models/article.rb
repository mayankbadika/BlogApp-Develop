class Article < ApplicationRecord
  has_many :comments,dependent: :destroy
  has_one_attached :avatar
  belongs_to :user
  validates :title ,presence: true
  validates :body ,presence: true,length: {minimum: 10, maximum: 3000}
  validates :user_id, presence: true
end
