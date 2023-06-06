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

  
end

##testing//

