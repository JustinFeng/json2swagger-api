require 'yaml'

module JSON2Swagger
  class API < Grape::API
    content_type :json, 'application/json'
    content_type :yaml, 'application/yaml'
    formatter :yaml, ->(object, _) { object.to_yaml.lines[1..-1].join }

    default_format :json

    desc 'Health check'
    get :health_check do
      { status: :ok }
    end

    desc 'Translate json to swagger doc'
    post :translate do
      JSON.parse(request.body.read).to_swagger
    end
  end
end
