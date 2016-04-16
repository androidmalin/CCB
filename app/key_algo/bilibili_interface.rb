=begin
  http://www.bilibili.com/video/av4371609/
  
  http://interface.bilibili.com/playurl?cid=7076936&player=1&ts=1460728450&sign=705c096777c7ed41d5cee161913c35be
  
  视频地址转 interface 地址
=end

require 'digest'


cid = '7076936'
# now we get interface url
appkey='85eb6835b0a1034e';  
secretkey = '2ad42749773c441109bdc0191257a664'
sign_this = Digest::MD5.hexdigest('appkey=' + appkey + '&cid=' + cid + secretkey)
interface_url = 'http://interface.bilibili.com/playurl?appkey=' + appkey + '&cid=' + cid + '&sign=' + sign_this  
puts(interface_url)












# md5 = Digest::MD5.new
#md5.update 'message1'
#md5 << '123'                     # << is an alias for update

#puts(md5.hexdigest)                         #=> "94af09c09bb9..."



# 【10分钟速成课：哲学】第5集 - 尼奥，遇见勒内·笛卡尔怀疑主义
# http://www.bilibili.com/video/av4371609/
# cid 7076936
# http://interface.bilibili.com/playurl?cid=7076936&player=1&ts=1460728450&sign=705c096777c7ed41d5cee161913c35be
# 21:54
# 1460728450

# http://interface.bilibili.com/playurl?cid=7076936&player=1&ts=1460728588&sign=9f38b386a9d6eaf0135b5ccab2c474da

# ts = timestamp = 当前请求时间的时间戳
# sign的长度和 md5 一样那应该就是 md5算法了

# 那现在就是折腾看看怎么弄成正确 sign 算法


# cid=7076936&player=1&ts=1460728588&sign=9f38b386a9d6eaf0135b5ccab2c474da

# cid = 7076936
# player = 1
# ts = 1460728588
# sign=9f38b386a9d6eaf0135b5ccab2c474da

#md5 << 'appsecret=2ad42749773c441109bdc0191257a664&'
#md5 << 'cid=7076936'  
#md5 << 'cid=7076936&'                
#md5 << 'player=1'        
#md5 << 'player=1&'              
#md5 << 'ts=1460728588'         
#md5 << 'ts=1460728588'               



#md5 << 'appsecret=ea85624dfcf12d7cc7b2b3a94fac1f2c&appkey=f3bb208b3d081dc8&cid=3885454&'
#sign=3aa2879fb591b4e297ed3e69156c821e 。


#puts(md5.hexdigest)                     
# 9f38b386a9d6eaf0135b5ccab2c474da


#1 搞对签名，然后再搞模拟请求头的事情








