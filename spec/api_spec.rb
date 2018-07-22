require './spec/spec_helper'
require './lib/api'
require 'yaml'

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

  describe 'POST /translate' do
    let(:data) { { 'some' => 'json' } }

    it 'responds 201' do
      post '/translate', data

      expect(last_response.status).to eq(201)
    end

    it 'returns application/yaml as Content-Type' do
      post '/translate', data

      expect(last_response.headers['Content-Type']).to eq('application/yaml')
    end

    it 'returns translation result in yml format' do
      post '/translate', data

      expect(last_response.body).to eq(data.to_yaml)
    end
  end
end
