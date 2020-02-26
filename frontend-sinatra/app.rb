# entry point
require 'sinatra'
require 'net/http'

# retrieve your api host address like this
#   settings.api => "someaddress.ondigitalocean.com"
set :api, ENV['API_HOST']
set :api_port, ENV['API_PORT'] || 80

# Show a pretty table of all users... rendered on a html page.
get '/' do
	uri = URI("http://#{ENV['API_HOST']}:#{ENV['API_PORT']}/users")
	@users = Net::HTTP.get(uri)
	@users = JSON.parse(@users)
	@results_num = @users.length()
  erb :index
end

get '/error' do
	erb :error
end
