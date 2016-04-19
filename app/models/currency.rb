require 'nokogiri'
require 'open-uri'

class Currency
  attr_reader :data
	
  def initialize(date)
	@error = false
	@data = prepare_data(date)	
  end 
		
  def get_elements(element_class)
	@data.css(element_class)
  end
  
  def error?
	@error
  end
		
  private
		
  def prepare_data(date)
	if date == Date.today.to_s
	  url = "http://www.nbp.pl/kursy/xml/LastA.xml"
				
	else
	  
	  if date.slice(0,4) == Date.today.year.to_s
		find = ""
	  else
		find = date.slice(0,4)
	  end
	  
	  date.slice!(0,2)
	  date.gsub!("-","")
			
	  begin
	    web_contents  = open("http://www.nbp.pl/kursy/xml/dir#{find}.txt").read
	    find = web_contents.match(/a.{3}z#{date}/)
	    url = "http://www.nbp.pl/kursy/xml/#{find}.xml"
	  rescue
	    @error = true
	    return
	  end	  
	end
			
	begin
	  data = Nokogiri::XML(open(url))
	rescue
	  @error = true
	  return
    end
			
	data
  end
end