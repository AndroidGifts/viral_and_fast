class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :editor
	has_and_belongs_to_many :categories

	has_attached_file :image, styles: { large: "900x900", medium: "400x400>", thumb: "150x150>"}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	scope :posts_of_week, lambda {where(:created_at => 1.week.ago..Time.now)}
	scope :visible, lambda {where(:visible => true)}
	scope :recent, lambda {order("posts.created_at DESC")}

	scope :odd, lambda {where("id % 2 = ?", "0")}
	scope :even, lambda {where("id % 2 = ?", "1")}

	scope :most_liked, lambda {order("posts.likes_count DESC")}
end