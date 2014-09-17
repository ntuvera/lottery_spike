require 'httparty'
require 'pry'
require 'pry-nav'

url = "http://www.state.nj.us/lottery/games/1-9_cash4life_history.shtml"

response = HTTParty.get(url)

numbers = response.scan(/\d+\-\d+\-\d+\-\d+\-\d+/)

all_hits = []
numbers.map do |line|
  all_hits.push(line.split(/\D+/)) 
end

all_hits.flatten!
all_hits.map! do |num|
  num.to_i
end

hash = Hash.new

1.upto(60) do |num|
  hash.merge! num => all_hits.count(num)
end


binding.pry
