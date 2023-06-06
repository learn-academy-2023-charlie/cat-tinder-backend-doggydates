class Dog < ApplicationRecord
    validates :name, :age, :breed, :image, :sex,  presence: true
end
