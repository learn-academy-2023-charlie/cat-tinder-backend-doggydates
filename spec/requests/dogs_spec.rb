require 'rails_helper'

RSpec.describe "Dogs", type: :request do
  describe "GET /index" do
    it 'gets a list of dogs' do
      Dog.create(
        name:'Lady',
        age: 4,
        breed: 'Cocker Spaniel',
        sex: 'F',
        image: 'https://static.wikia.nocookie.net/disney/images/0/06/Profile_-_Lady.jpeg/revision/latest?cb=20190314123153'
        )
        get '/dogs'
        dog = JSON.parse(response.body)

        expect(response).to have_http_status(200)
        expect(dog.length).to eq 1
    end
  end

  describe "POST /create" do
    it 'creates a dog' do
      dog_params = {
        dog: {
          name:'Lady',
          age: 4,
          breed: 'Cocker Spaniel',
          sex: 'F',
          image: 'https://static.wikia.nocookie.net/disney/images/0/06/Profile_-_Lady.jpeg/revision/latest?cb=20190314123153'
        }
      }
      post '/dogs', params: dog_params
      expect(response).to have_http_status(200)
      dog = Dog.first
      expect(dog.name).to eq 'Lady'
      expect(dog.age).to eq 4
      expect(dog.breed).to eq 'Cocker Spaniel'
      expect(dog.sex).to eq 'F'
    end  
  end  

  describe "PATCH /update" do
    it 'updates the dog' do 
      dog_params = {
        dog: {
          name:'Lady',
          age: 4,
          breed: 'Cocker Spaniel',
          sex: 'F',
          image: 'https://static.wikia.nocookie.net/disney/images/0/06/Profile_-_Lady.jpeg/revision/latest?cb=20190314123153'
        }
      }
      post '/dogs', params: dog_params
      dog = Dog.first

      updated_dog_params = {
        dog: {
          name:'Tramp',
          age: 6,
          breed: 'Mutt',
          sex: 'M',
          image: 'https://static.wikia.nocookie.net/disney/images/0/06/Profile_-_Lady.jpeg/revision/latest?cb=20190314123153'
        }
      }
      patch '/dogs/#{dog.id}', params: updated_dog_params
      updated_dog = dog.find(dog.id)
      expect(response).to have_http_status(200)
      expect(updated_dog.name).to eq 'Tramp'
      expect(updated_dog.age).to eq 6
      expect(updated_dog.breed).to eq 'Mutt'
      expect(updated_dog.sex).to eq 'M'
      
    end  
  end
end

##testing//

