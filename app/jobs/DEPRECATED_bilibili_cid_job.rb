class BilibiliCidJob < ActiveJob::Base
  queue_as :default

# Bilibili Job
# get CID by AID( AV ),  then put into database
  def perform(episode_id, aid)

  	# get cid first
  	api = 'http://www.bilibili.com/m/html5?aid=' + aid.to_s

	url = URI.parse(api)
	http = Net::HTTP.new(url.host, url.port)
	request = Net::HTTP::Get.new(url.request_uri)
	response = http.request(request)
	json = JSON.parse(response.body)
	cid = /(\d+)/.match(json['cid'])
	cid = cid.to_s

	# now we get interface url
	appkey='85eb6835b0a1034e';  
	secretkey = '2ad42749773c441109bdc0191257a664'
	sign_this = Digest::MD5.hexdigest('appkey=' + appkey + '&cid=' + cid + secretkey)
	interface_url = 'http://interface.bilibili.com/playurl?appkey=' + appkey + '&cid=' + cid + '&sign=' + sign_this  

	# store into database
	episode = Episode.find_by_id(episode_id)
	episode.interface = interface_url
	episode.save

	# SAVE TO FILE code not work. encoding problem. utf-8 problem.
	# out_file = File.new("/home/a/Desktop/problem.txt", "w:UTF-8")
	# str = response.body
	# str = str.force_encoding('GBK')  
	# str = str.encode('UTF-8')  
	# out_file.write(str)
	# out_file.close
  end
end
