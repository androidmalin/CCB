class TestController < ApplicationController
layout false
  def index
  	# render :nothing => true

=begin
	redis = Redis.new
	redis.set('a', 'vasdasdads')
	c = redis.get("a")
	
=end

	# 	url = URI.parse('http://106.75.130.23/api/newest/1')
	# req = Net::HTTP::Get.new(url.to_s)
	# res = Net::HTTP.start(url.host, url.port) {|http|
	#   http.request(req)
	# }
	# #render :inline => res.body
  	
  end
  


 
end
