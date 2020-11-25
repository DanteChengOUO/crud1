class Book < ApplicationRecord
  validates :name ,presence: true ,length: { minimum: 4}
  validates :price ,presence: true
end 
