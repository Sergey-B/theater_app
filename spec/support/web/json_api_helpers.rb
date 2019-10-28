# frozen_string_literal: true

class Rack::MockResponse
  def parsed
    @parsed ||= JSON.parse(body).with_indifferent_access
  end
end

module Test
  module JsonApiHelpers
    def json_response
      JSON.parse(last_response.body).with_indifferent_access
    end

    def json_request(method, url, data: nil, jwt: nil, headers: {})
      env = { 'CONTENT_TYPE' => 'application/json' }
      env['HTTP_AUTHORIZATION'] = "Bearer #{jwt}" if jwt
      env.merge!(headers.stringify_keys)

      body = data.try :to_json

      public_send method, url, body, env.merge(headers)
    end

    def get_json(url, jwt: nil, headers: {})
      json_request :get, url, jwt: jwt, headers: headers
    end

    def post_json(url, data:, jwt: nil, headers: {})
      json_request :post, url, data: data, jwt: jwt, headers: headers
    end

    def put_json(url, data:, jwt: nil, headers: {})
      json_request :put, url, data: data, jwt: jwt, headers: headers
    end

    def patch_json(url, data:, jwt: nil, headers: {})
      json_request :patch, url, data: data, jwt: jwt, headers: headers
    end

    def delete_json(url, jwt: nil, headers: {})
      json_request :delete, url, jwt: jwt, headers: headers
    end
  end
end
