class Editor < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
	has_many :comments
	has_many :posts
	has_and_belongs_to_many :categories

	has_attached_file :user_avatar, styles: { large: "600x600", medium: "300x300>", thumb: "150x150"}
	validates_attachment_content_type :user_avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
