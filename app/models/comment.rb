class Comment < ApplicationRecord
  belongs_to :article
  has_many :replies, class_name: "Comment", foreign_key: "initial_comment"
  belongs_to :initial_comment, class_name: "Comment", optional: true 
end
