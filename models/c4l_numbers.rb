# url = "http://www.state.nj.us/lottery/games/1-9_cash4life_history.shtml"

# response = HTTParty.get(url)

# numbers = response.scan(/\d+\-\d+\-\d+\-\d+\-\d+/)

# all_hits = []
# numbers.map do |line|
#   all_hits.push(line.split(/\D+/))
# end

# all_hits.flatten!
# all_hits.map! do |num|
#   num.to_i
# end

# hash = Hash.new

# 1.upto(60) do |num|
#   hash.merge! num => all_hits.count(num)
# end

class Numbers
  def self.retrieve
    url = "http://www.state.nj.us/lottery/games/1-9_cash4life.shtml"
    response = HTTParty.get(url)
    dates = response.scan(/\d+\/\d+\/\d+/)
    numbers = response.scan(/\d+\-\d+\-\d+\-\d+\-\d+/)
    bonus = response.scan(/(?=\d{2}<\/td><td valign=\"top\" align=\"center\">)[0]\d{1}/)
    # results = {}
    all_hits = []
    binding.pry
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
    return hash
  end

  def self.sort(hash)
    @sorted = hash.sort_by { |k,v| v }.reverse
  end
end
