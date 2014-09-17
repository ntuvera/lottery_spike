require 'bundler'
Bundler.require

require_relative 'models/c4l_numbers.rb'

get '/' do

  @numbers = Numbers.retrieve
  @hits = Numbers.retrieve
  @self = Numbers.sort(@numbers)
  @popular = Numbers.sort(@numbers).first(10)
  erb :index
end
