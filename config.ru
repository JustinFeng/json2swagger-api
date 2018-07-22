require './boot'
require './lib/api'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: %i[get post]
  end
end

run JSON2Swagger::API
