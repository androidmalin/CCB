
class TestController < ApplicationController

  layout false
  def index
  u = 'http://www.bilibili.com/video/av4281373/'
#require 'uri'

uri = URI.parse(u)
host_middle = uri.host.split('.')[1]

if host_middle == 'bilibili'
	render :inline => 'yes'
else
	render :inline => 'no'
end



=begin
appkey='85eb6835b0a1034e';  
secretkey = '2ad42749773c441109bdc0191257a664'
cid = "6922784"

sign_this = Digest::MD5.hexdigest('appkey=' + appkey + '&cid=' + cid + secretkey)
url = 'http://interface.bilibili.com/playurl?appkey=' + appkey + '&cid=' + cid + '&sign=' + sign_this  
  render :inline => url
=end

  end
  


  
  
end
