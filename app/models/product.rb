class Product < ApplicationRecord
  mount_uploader :img, ImgUploader
end
