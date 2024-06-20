# frozen_string_literal: true
require 'net/http'
require 'json'

module Stacky::CurateApiHelper
  def self.get(url)
    uri = URI(url)
    response = Net::HTTP.get_response(uri)

    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      puts "Error: #{response.message}"
      nil
    end
  rescue StandardError => e
    puts "Error: #{e.message}"
    nil
  end

  def self.post(url, body)
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request.body = body.to_json
    response = http.request(request)

    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      puts "Error: #{response.message}"
      nil
    end
  rescue StandardError => e
    puts "Error: #{e.message}"
    nil
  end
  def self.index_status(status)
    # extract the status information
    # TODO
    # and then call the GET api endpoints
    # self.get("http://example.com/api/endpoint")
    # or POST
    body = { text: status.text, id: status.id }
    # post("http://beta.stacky.social:3009/index_status", body)
    "stub index success >>>> status id: #{status.id} msg: #{status.text} >> #{status.visibility}"
  end
  def self.update_index_status(status)
    # extract the status information
    # TODO
    # and then call the post to api endpoints
    body = { text: status.text, id: status.id }
    # post("http://beta.stacky.social:3009/update_index", body)
    "stub update index success >>>> status: #{status.id} msg: #{status.text} >> #{status.visibility}"
  end

end
