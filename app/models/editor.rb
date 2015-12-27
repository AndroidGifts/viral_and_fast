class Editor < ActiveRecord::Base
	has_many :comments
	has_many :posts
	has_and_belongs_to_many :categories
end
