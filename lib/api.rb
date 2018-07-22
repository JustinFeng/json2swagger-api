require 'grape-swagger'
require 'yaml'

module JSON2Swagger
  class API < Grape::API
    content_type :json, 'application/json'
    content_type :yaml, 'application/yaml'

    default_format :json

    desc 'Health check'
    get :health_check do
      { status: :ok }
    end

    desc 'Translate json to swagger doc'
    default_format :yaml
    post :translate do
      params.to_hash.to_yaml
    end

    add_swagger_documentation
  end
end
