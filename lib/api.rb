require 'grape-swagger'

module JSON2Swagger
  class API < Grape::API
    include Grape::Extensions::Hash::ParamBuilder

    content_type :json, 'application/json'
    content_type :yaml, 'application/yaml'

    default_format :json

    before do
      header 'Access-Control-Allow-Origin', '*'
      header 'Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept'
    end

    desc 'Health check'
    get :health_check do
      { status: :ok }
    end

    desc 'Translate json to swagger doc'
    default_format :yaml
    post :translate do
      params.to_yaml
    end

    add_swagger_documentation
  end
end
