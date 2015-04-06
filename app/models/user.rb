class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

       validates :name, presence: true


     # User / listing relationship (when user deleted, listing is deleted too)
       has_many :lisitngs, dependent: :destroy
end
