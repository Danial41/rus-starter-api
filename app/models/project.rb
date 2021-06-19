class Project < ApplicationRecord
  belongs_to :user
  has_many :participants

  has_one_attached :image

  validates :image, {
      presence: true
  }
end
