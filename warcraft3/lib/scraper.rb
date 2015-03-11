require "open-uri"
require "nokogiri"
require "pry"

website = "http://classic.battle.net/war3/human/unitstats.shtml"
@doc = Nokogiri::HTML(open(website))

info = @doc.xpath("//td[contains(@class, 'ladderTable')]/table/tr")



valuearr = []
keyarr = []

info.each do |character|
  statarr = []
  character.css('font').each do |stat|
    statarr << stat.text()
  end
  valuearr << statarr.drop(1)
end

info.each do |character|
  statarr = []
  character.css('font').each do |stat|
    statarr << stat.text()
  end
  keyarr << statarr.shift
end

keyarr.drop(2)
valuearr.drop(2)

$production = Hash[keyarr.drop(1).zip valuearr.drop(1)]

binding.pry

