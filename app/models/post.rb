class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :editor
	has_and_belongs_to_many :categories
end
