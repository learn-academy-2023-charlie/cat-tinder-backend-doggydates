class Dog < ApplicationRecord
    validates :name, :age, :breed, :image, :sex,  presence: true
    validates :name, :breed, length: { minimum: 4 }
    validates :age, numericality: { in: 1..7 }
end
