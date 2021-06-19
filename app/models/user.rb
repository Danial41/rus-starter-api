class User < ApplicationRecord
    has_secure_password

    has_many :projects
    has_many :competences
    has_one :profile
    has_many :participants

    has_one_attached :image

    validates :image, {
        presence: true
    }
end
