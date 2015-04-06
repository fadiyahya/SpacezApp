class Listing < ActiveRecord::Base
if Rails.env.development?
	  has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "/images/missing.jpg"
	   					validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png)

else
  has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "/images/missing.jpg",
   					:storage => :dropbox,
   	 				:dropbox_credentials => Rails.root.join("config/dropbox.yml")
 					validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png),
 					:path => ":style/:id_:filename"
 	end

 	 validates :name, :price, :location, :city, presence: true
 	 validates :price, numericality: true

		validates :image, :attachment_presence => true
		validates_with AttachmentPresenceValidator, :attributes => :image
		validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 2.megabytes

		#Listing / User relationship
		belongs_to :user
		end
