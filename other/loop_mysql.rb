# loop though mysql table and change data
require "mysql2"
require 'net/http'

client = Mysql2::Client.new(:host => "localhost", 
:username => "root", 
:password => "admin",
:database => 'cc')

all_episode = "SELECT * FROM episodes"

client.query(all_episode).each do |row|
  # do something with row, it's ready to rock

    video_link = row['video_link']  #assume this is 'http://www.bilibili.com/video/av4281373/'

    uri = URI.parse(video_link)

    host_middle = uri.host.split('.')[1]  # host_middle would be  'bilibili'
    if host_middle == 'bilibili'
          aid = /(\d+)/.match(video_link)
          aid = aid.to_s
          api = 'http://www.bilibili.com/m/html5?aid=' + aid + '&page=1'
          
          update_sql = 'UPDATE episodes SET html5 = "' + api + '" WHERE id = ' + row['id'].to_s
          client.query(update_sql)
    end

end

