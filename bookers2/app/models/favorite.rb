class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :book
  
  validates :book, uniqueness: true
   
end
