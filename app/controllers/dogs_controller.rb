class DogsController < ApplicationController

    def index
        dogs = Dog.all
        render json: dogs
    end    

    def create
        dog = Dog.create(dog_params)
        if dog.valid?
            render json: dog
        else 
            render json: dog.errors, status: 422    
        end    
    end    

     def update
        
     end
     
     def destroy
     end
     
     private
     def dog_params
        params.require(:dog).permit(:name, :age, :breed, :sex, :image)
     end   
end
