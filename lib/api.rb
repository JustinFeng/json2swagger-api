require 'grape-swagger'

module JSON2Swagger
  class API < Grape::API
    include Grape::Extensions::Hashie::Mash::ParamBuilder

    format :json

    before do
      header 'Access-Control-Allow-Origin', '*'
      header 'Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept'
    end

    get :health_check do
      { status: :ok }
    end

    add_swagger_documentation
  end
end