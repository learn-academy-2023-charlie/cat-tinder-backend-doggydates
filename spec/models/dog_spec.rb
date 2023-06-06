require 'rails_helper'

RSpec.describe Dog, type: :model do
  it 'should have a name' do
    dog = Dog.create(
      {
        name:nil,
        age: 8,
        breed: 'Dalmation',
        sex: 'M',
        image: 'https://static.wikia.nocookie.net/disney/images/3/3c/Profile_-_Pongo.png/revision/latest?cb=20200504214003'
      }
    )
    expect(dog.errors[:name]).to_not be_empty
  end

  it 'should have a age' do
    dog = Dog.create(
      {
        name:'Pongo',
        age:nil,
        breed: 'Dalmation',
        sex: 'M',
        image: 'https://static.wikia.nocookie.net/disney/images/3/3c/Profile_-_Pongo.png/revision/latest?cb=20200504214003'
      }
    )
    expect(dog.errors[:age]).to_not be_empty
  end

  it 'should have a breed' do
    dog = Dog.create(
      {
        name:'Pongo',
        age:8,
        breed:nil,
        sex: 'M',
        image: 'https://static.wikia.nocookie.net/disney/images/3/3c/Profile_-_Pongo.png/revision/latest?cb=20200504214003'
      }
    )
    expect(dog.errors[:breed]).to_not be_empty
  end

  it 'should have a sex' do
    dog = Dog.create(
      {
        name:'Pongo',
        age:8,
        breed: 'Dalmation',
        sex:nil,
        image: 'https://static.wikia.nocookie.net/disney/images/3/3c/Profile_-_Pongo.png/revision/latest?cb=20200504214003'
      }
    )
    expect(dog.errors[:sex]).to_not be_empty
  end

  it 'should have an image' do
    dog = Dog.create(
      {
        name:'Pongo',
        age:8,
        breed: 'Dalmation',
        sex: 'M',
        image:nil
      }
    )
    expect(dog.errors[:image]).to_not be_empty
  end
  
  it 'cannot add a dog with a name less than 4 characters' do
    dog = Dog.create(
      {
        name:'Pon',
        age:8,
        breed: 'Dalmation',
        sex:'M',
        image: 'https://static.wikia.nocookie.net/disney/images/3/3c/Profile_-_Pongo.png/revision/latest?cb=20200504214003'
      }
    )
    expect(dog.errors[:name]).to_not be_empty
  end

  it 'cannot add a dog with a breed less than 4 characters' do
    dog = Dog.create(
      {
        name:'Pongo',
        age:8,
        breed: 'Dal',
        sex:'M',
        image: 'https://static.wikia.nocookie.net/disney/images/3/3c/Profile_-_Pongo.png/revision/latest?cb=20200504214003'
      }
    )
    expect(dog.errors[:breed]).to_not be_empty
  end

  it 'cannot add a dog with an age younger than 1 or older than 7' do
    dog = Dog.create(
      {
        name:'Pongo',
        age:8,
        breed: 'Dalmation',
        sex:'M',
        image: 'https://static.wikia.nocookie.net/disney/images/3/3c/Profile_-_Pongo.png/revision/latest?cb=20200504214003'
      }
    )
    expect(dog.errors[:age]).to_not be_empty
  end

end
