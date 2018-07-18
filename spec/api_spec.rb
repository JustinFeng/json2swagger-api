require './spec/spec_helper'
require './lib/api'

describe JSON2Swagger::API do
  include Rack::Test::Methods

  def app
    JSON2Swagger::API
  end

  describe 'GET /health_check' do
    it 'responds 200' do
      get '/health_check'

      expect(last_response.status).to eq(200)
    end

    it 'returns system status' do
      get '/health_check'

      expect(JSON.parse(last_response.body)['status']).to eq('ok')
    end
  end
end
