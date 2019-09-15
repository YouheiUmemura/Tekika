class Product < ApplicationRecord
  belongs_to :user
  has_many :rooms
  mount_uploader :image, ImagesUploader
  
  has_many :favorites, dependent: :destroy
  
  has_many :reviews, dependent: :destroy

  
  
   def self.search(search) 
    if search 
      Product.where(['title LIKE ?', "%#{search}%"])
    else
      Product.all 
    end
  end
end
