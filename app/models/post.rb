class Post < ApplicationRecord
  validates :title, :link, :presence => true
  belongs_to :user
end
