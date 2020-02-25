# entry point
require 'sinatra'
require 'net/http'

# retrieve your api host address like this
#   settings.api => "someaddress.ondigitalocean.com"
set :api, ENV['API_HOST']
set :api_port, ENV['API_PORT'] || 80

# Show a pretty table of all users... rendered on a html page.
get '/' do
	uri = URI("http://127.0.0.1:4568/users")
	@users = Net::HTTP.get(uri)
	@users = JSON.parse(@users)
	@results_num = @users.length()
  erb :index
end
