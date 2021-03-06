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
    let(:data) do
      { 'a' => 1, 'b' => 1.1, 'c' => '1', 'd' => true, 'e' => false, 'f' => [1], 'g' => {}, 'h' => nil }.to_json
    end

    context 'Accept application/yaml' do
      it 'responds 201' do
        header 'Accept', 'application/yaml'
        post '/translate', data

        expect(last_response.status).to eq(201)
      end

      it 'returns application/yaml as Content-Type' do
        header 'Accept', 'application/yaml'
        post '/translate', data

        expect(last_response.headers['Content-Type']).to eq('application/yaml')
      end

      it 'returns translation result in yml format' do
        header 'Accept', 'application/yaml'
        post '/translate', data

        expect(last_response.body).to eq({
          'type' => 'object',
          'properties' => {
            'a' => {
              'type' => 'integer',
              'example' => 1
            },
            'b' => {
              'type' => 'number',
              'example' => 1.1
            },
            'c' => {
              'type' => 'string',
              'example' => '1'
            },
            'd' => {
              'type' => 'boolean',
              'example' => true
            },
            'e' => {
              'type' => 'boolean',
              'example' => false
            },
            'f' => {
              'type' => 'array',
              'items' => {
                'type' => 'integer',
                'example' => 1
              }
            },
            'g' => {
              'type' => 'object',
              'properties' => {}
            },
            'h' => {
              'type' => 'UNKNOWN'
            }
          }
        }.to_yaml.lines[1..-1].join)
      end
    end

    context 'Accept application/json' do
      it 'responds 201' do
        header 'Accept', 'application/json'
        post '/translate', data

        expect(last_response.status).to eq(201)
      end

      it 'returns application/json as Content-Type' do
        header 'Accept', 'application/json'
        post '/translate', data

        expect(last_response.headers['Content-Type']).to eq('application/json')
      end

      it 'returns translation result in json format' do
        header 'Accept', 'application/json'
        post '/translate', data

        expect(last_response.body).to eq(
          JSON.pretty_generate(
            'type' => 'object',
            'properties' => {
              'a' => {
                'type' => 'integer',
                'example' => 1
              },
              'b' => {
                'type' => 'number',
                'example' => 1.1
              },
              'c' => {
                'type' => 'string',
                'example' => '1'
              },
              'd' => {
                'type' => 'boolean',
                'example' => true
              },
              'e' => {
                'type' => 'boolean',
                'example' => false
              },
              'f' => {
                'type' => 'array',
                'items' => {
                  'type' => 'integer',
                  'example' => 1
                }
              },
              'g' => {
                'type' => 'object',
                'properties' => {}
              },
              'h' => {
                'type' => 'UNKNOWN'
              }
            }
          )
        )
      end
    end
  end
end
