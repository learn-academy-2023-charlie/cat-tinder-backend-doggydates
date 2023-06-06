# README
 git checkout -b backend-structure
 bundle
 rails g resource Dog name:string age:integer breed:string sex:string image:text
 code .
 rails db:create
 rails db:migrate
 rspec spec
 rails c
 rails db:seed
 bundle add rack-cors


 bundle
 rails db:setup
 code .
 Add an index request spec to application
 Add an index endpoint to application
 run test:
 rspec spec/requests/dogs_spec.rb

 Create end point to view all instances:
 dogs = Dog.all
 render json: dogs


