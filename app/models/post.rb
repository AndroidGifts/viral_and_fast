class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :editor
	has_and_belongs_to_many :categories

	has_attached_file :image, styles: { large: "900x900", medium: "400x400>", thumb: "150x150>"}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
