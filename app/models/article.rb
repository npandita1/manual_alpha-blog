class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum:6, maximum:100}
    validates :description, presence: true, length: {minimum:10, maximum:400}
    has_many :comments
end    