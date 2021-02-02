# frozen_string_literal: true

require 'faraday'
require_relative "graphql_client_f/version"

module GraphQLClientF
  class Client
    BASE_HEADERS = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    attr_accessor :url, :headers, :body, :response

    def initialize(url:, headers: {})
      @url = url
      @body = {}
      @headers = BASE_HEADERS.merge(headers)
    end

    def query(query:, variables: nil, operation_name: nil)
      self.body = {query: query, variables: variables, operationName: operation_name}
      self.response = Faraday.post(url, body.to_json, headers)
    end
  end
end
