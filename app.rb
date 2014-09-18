require 'bundler'
Bundler.require

require_relative 'models/c4l_numbers.rb'

get '/' do
  @results = Numbers.results
  @dates = @results[:dates]
  @numbers_res = @results[:numbers]
  @numbers_bonus = @results[:bonus]
  @numbers = Numbers.retrieve
  @hits = Numbers.retrieve
  @self = Numbers.sort(@numbers)
  @popular = Numbers.sort(@numbers).first(10)
  @picks =[]
binding.pry
  # @picks.push(5.times { Numbers.sort(@numbers).first(20).sample[0]) })
  erb :index
end
