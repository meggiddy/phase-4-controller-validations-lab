class Post < ApplicationRecord
  validates :title, presence: true
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "must be either Fiction or Non-Fiction"}
  validates :content, presence: true, length: {minimum: 100}
end
