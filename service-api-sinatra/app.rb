# entry point
require 'sinatra'
require 'faker'
require_relative './models/user'

# Retrieve all users from database.
get '/users' do
  result = User.select(:name, :email, :bio)
  result.to_json

end

# Create n users.
post '/users' do
  count = params[:n].to_i || 1
  if count > 30
  	halt 400
  end
  while count > 0
  	User.create(name: Faker::Name.name, email: Faker::Internet.email, bio: Faker::Dessert.variety, 
  		password: Faker::Number.number(digits: 10))
  	count -= 1
  end
  # default code 200 returned
  redirect 'http://64.225.28.210' #IP for front-end
end

# Delete all users.
post '/users/destroy' do
  User.destroy_all
  status 200
  redirect 'http://64.225.28.210'
end
