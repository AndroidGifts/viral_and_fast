class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :editor
	has_and_belongs_to_many :categories

	has_attached_file :image, styles: { large: "600x600", medium: "300x300>", thumb: "150x150#"}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
