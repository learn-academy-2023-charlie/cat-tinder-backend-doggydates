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
    it 'will not create a dog that is missing a name' do
      dog_params = {
        dog: {
          name:nil,
          age: 4,
          breed: 'Cocker Spaniel',
          sex: 'F'
        }
      }
      post '/dogs', params: dog_params
      p "create response", response.status
      expect(response.status).to eq(422)
      dog_json = JSON.parse(response.body)
      expect(dog_json['name']).to include "can't be blank"
    end
    it 'will not create a dog that is missing an age' do
      dog_params = {
        dog: {
          name:'Lady',
          age:nil,
          breed: 'Cocker Spaniel',
          sex: 'F'
        }
      }
      post '/dogs', params: dog_params
      p "create response", response.status
      expect(response.status).to eq(422)
      dog_json = JSON.parse(response.body)
      expect(dog_json['age']).to include "can't be blank"
    end
    it 'will not create a dog that is missing a breed' do
      dog_params = {
        dog: {
          name:'Lady',
          age: 4,
          breed:nil,
          sex: 'F'
        }
      }
      post '/dogs', params: dog_params
      p "create response", response.status
      expect(response.status).to eq(422)
      dog_json = JSON.parse(response.body)
      expect(dog_json['breed']).to include "can't be blank"
    end
    it 'will not create a dog that is missing a sex' do
      dog_params = {
        dog: {
          name:'Lady',
          age: 4,
          breed: 'Cocker Spaniel',
          sex:nil
        }
      }
      post '/dogs', params: dog_params
      p "create response", response.status
      expect(response.status).to eq(422)
      dog_json = JSON.parse(response.body)
      expect(dog_json['sex']).to include "can't be blank"
    end
  end  

  describe "PATCH /update" do
    it "updates a dog" do
      dog_params = {
        {
        dog:  name:'Lady',
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
          name: 'Buster',
          age: 5,
          enjoys: 'Meow Mix, and plenty of sunshine.', 
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
  
      patch "/dogs/#{dog.id}", params: updated_dog_params
      updated_dog = Dog.find(dog.id)
      expect(response).to have_http_status(200)
      expect(updated_dog.age).to eq 5
    end
  end

end

##testing//

