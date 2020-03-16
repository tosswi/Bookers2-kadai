class Book < ApplicationRecord
	validates :title, presence: true
	validates :body, length:{in: 1..200 }, allow_blank: true
    validates :body, presence: true
    belongs_to :user
end
