require 'json'
require 'net/http'
require 'uri'

class WeathersController < ApplicationController
  unloadable


  def index
    @weathers = Weather.all
  end
end
