require 'net/http'
require 'uri'


class Api::V1::FactsController < ApplicationController
  before_action :find_fact, only: [:show, :update, :destroy]


  def index
    @facts = Fact.all
    # render json: @facts
    


    # p 'Hello World!'

    $API_KEY = "V0lOejNUz5rx2ITKPf8DUgtt"


    # require 'net/http'

    # uri = URI.parse("http://example.org")

    # Shortcut
    # response = Net::HTTP.post_form(uri, {"user[name]" => "testusername", "user[email]" => "testemail@yahoo.com"})

    # Full control
    # http = Net::HTTP.new(uri.host, uri.port)
    # request = Net::HTTP::Post.new(uri.request_uri)
      # request.set_form_data({"user[name]" => "testusername", "user[email]" => "testemail@yahoo.com"})
    # response = http.request(request)
      # raise response
    # render :json => response.body


    # curl -XGET https://api.sonix.ai/v1/media?page=0 -H "Authorization: Bearer abcd"
    
    # uri = URI.parse("https://api.sonix.ai/v1/media?page=0")
    # request = Net::HTTP::Get.new(uri)
    # request["Authorization"] = "Bearer V0lOejNUz5rx2ITKPf8DUgtt"

    # req_options = {
    #   use_ssl: uri.scheme == "https",
    # }

    # response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    #   http.request(request)
    # end

    # response.code
    # response.body

    # uri = URI.parse("https://api.sonix.ai/v1/media?page=0 -H 'Authorization: Bearer V0lOejNUz5rx2ITKPf8DUgtt'")
    # http = Net::HTTP.new(uri.host, uri.port)
    # request = Net::HTTP::Post.new(uri.request_uri)
    # response = http.request(request)
    # raise response.body


    # // Send wav file to sonix, @my_audio.mp3 = absolute path of file
    # curl -XPOST https://api.sonix.ai/v1/media -H "Authorization: Bearer <API Key>"  \
    #   -F file=@my_audio.mp3 \
    #   -F language=en \
    #   -F name='Aug27_menu' \
    #   -F keywords='NAS, Pensacola, Galley, menu'

    uri = URI.parse("https://api.sonix.ai/v1/media/j2gojRk2")
    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = "Bearer V0lOejNUz5rx2ITKPf8DUgtt"
    req_options = {
      use_ssl: uri.scheme == "https",
      file=@my_audio.wav
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    response.code


    uri = URI('http://www.example.com/search.cgi')
    res = Net::HTTP.post_form(uri, 'q' => ['ruby', 'perl'], 'max' => '50')
    puts res.body

    uri = URI('http://www.example.com/search.cgi')
    res = Net::HTTP.post_form(uri, 'q' => ['ruby', 'perl'], 'max' => '50')
    puts res.body





    # curl -XGET https://api.sonix.ai/v1/media/<qmnY1nD5> -H "Authorization: Bearer <API Key>" 

    uri = URI.parse("https://api.sonix.ai/v1/media/j2gojRk2")
    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = "Bearer V0lOejNUz5rx2ITKPf8DUgtt"
    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    response.code

    # curl -XGET https://api.sonix.ai/v1/media/<qmnY1nD5>/transcript -H "Authorization: Bearer <API Key>" 

    # uri = URI.parse("https://api.sonix.ai/v1/media/j2gojRk2/transcript.json")

    uri = URI.parse("https://api.sonix.ai/v1/media/j2gojRk2/transcript")
    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = "Bearer V0lOejNUz5rx2ITKPf8DUgtt"
    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end    

    # raise response.body

    render :json => response.body









  end












  def show



    render json: @fact
  end










  def create
    @fact = Fact.new(fact_params)
    if @fact.save
      render json: @fact
    else
      render error: { error: 'Unable to create fact.' }, status: 400
    end
  end


  def update
    if @fact
      @fact.update(fact_params)
      render json: { message: 'Fact successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to update fact.' }, status:400
    end
  end


  def destroy
    if @fact
      @fact.destroy
      render json: { message: 'Fact successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete fact.' }, status: 400
    end    
  end

  private

  def fact_params
    params.require(:fact).permit(:fact, :likes, :user_id)
  end

  def find_fact
    @fact = Fact.find(params[:id])
  end

end
