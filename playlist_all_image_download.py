'''
Create date: 2016-4-13
Author: github@1c7
Python3


程序用途：
下载 playlist 里所有视频的 thumbnail
分辨率都是 320 x 180

input: 播放列表, 如 https://www.youtube.com/watch?v=vo4pMVb0R6M&list=PL8dPuuaLjXtOPRKzVLY0jJY-uHOH9KVU6


也就是这个地址的图: http://img.youtube.com/vi/<视频ID>/mqdefault.jpg 

Youtube 本身有 API
可以根据 playlist ID 来获得所有视频的信息
https://developers.google.com/youtube/v3/docs/playlistItems/list#try-it

example:
GET https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails&maxResults=50&playlistId=PL8dPuuaLjXtOPRKzVLY0jJY-uHOH9KVU6&key=AIzaSyCdo3DB1g3USTBVWN8cDPjVgNyPE-h6UwM

'''
import requests
import sys
import json
import shutil
import os

#
#  change these
#
playlistID = '  PL8dPuuaLjXtPHzzYuWy6fYEaX9mQQ8oGr '
folder_name = ' Chemistry  '
place_folder_at = '//home/a/Desktop/'



#
# don't change these
#
try_time = 3
playlistID = playlistID.strip()
folder_name = folder_name.strip()

full_path = place_folder_at + folder_name + '/'
if not os.path.exists(full_path):
    os.makedirs(full_path)

Youtube_API_KEY = "AIzaSyCdo3DB1g3USTBVWN8cDPjVgNyPE-h6UwM"
API_ADDRESS = "https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails%2Cstatus%2Cid%2Csnippet&maxResults=50&playlistId="+ playlistID +"&key="
URL = API_ADDRESS + Youtube_API_KEY
print(URL)

r = requests.get(URL, stream=True, timeout=3000)
j = json.loads(r.text)
print("GOT JSON SUCCESS")

for one in j["items"]:
	image_url = "https://img.youtube.com/vi/%s/mqdefault.jpg" % one["contentDetails"]["videoId"]
	title = one['snippet']['title']
	number = title.split("#");
	try:
		seq = number[1] + ". "
	except Exception as e:
		seq = '' 

	filename = seq + title + ".jpg"
	path  = full_path + filename
	if os.path.exists(path) != True: 
		# logic here is when request image url get error. try couple time
		try_couple_time  = try_time
		while True:
			try:
				r = requests.get(image_url, stream=True, timeout=3000)
			except Exception as e:
				try_couple_time = try_couple_time - 1
				if try_couple_time > 0:
					continue
			break
		# save file
		r.raw.decode_content = True
		f = open(path, 'wb+')
		shutil.copyfileobj(r.raw, f)  
		f.close()
		print(filename + "  success") 
