class Listing < ActiveRecord::Base
if Rails.env.development?
	  has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "/images/missing.jpg"
else
  has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "/images/missing.jpg",
   					:storage => :dropbox,
   	 				:dropbox_credentials => Rails.root.join("config/dropbox.yml")
 					 validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/,
 					:path => ":style/:id_:filename"
 	end
end
