class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :users
  validates :title, :content, presence: true
  self.per_page = 4
end
