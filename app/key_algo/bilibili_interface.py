#python3

import sys
import hashlib
#print(hashlib.md5('123'.encode()).hexdigest())

appkey='85eb6835b0a1034e';  
secretkey = '2ad42749773c441109bdc0191257a664'

#cid = '2051663'
#sign_this = hashlib.md5(bytes('appkey=' + appkey + '&cid=' + cid + secretkey, 'utf-8')).hexdigest()  
#url = 'http://interface.bilibili.com/playurl?appkey=' + appkey + '&cid=' + cid + '&sign=' + sign_this  
#print(url)
#============================================================================
# http://interface.bilibili.com/playurl?cid=7076936&player=1&ts=1460728588&sign=9f38b386a9d6eaf0135b5ccab2c474da
# cid = 7076936
# player = 1
# ts = 1460728588
# sign=9f38b386a9d6eaf0135b5ccab2c474da

cid = '7076936'
sign_this = hashlib.md5(bytes('appkey=' + appkey + '&cid=' + cid + secretkey, 'utf-8')).hexdigest()  
#url = 'http://interface.bilibili.com/playurl?appkey=' + appkey + '&cid=' + cid + '&sign=' + sign_this  
#url = 'http://interface.bilibili.com/playurl?cid=' +cid +'&player=1&ts=1460728588' + '&sign=' + sign_this  

print(sign_this)

# output sign should be: 9f38b386a9d6eaf0135b5ccab2c474da
sys.exit()


















APPKEY = '85eb6835b0a1034e'
SECRETKEY = '2ad42749773c441109bdc0191257a664'


#----------------------------------------------------------------------
def calc_sign(string):
    """str/any->str
    return MD5."""
    return str(hashlib.md5(str(string).encode('utf-8')).hexdigest())

#----------------------------------------------------------------------
def get_flash_live_address_from_cid2222(cid):
    """"""
    str_to_hash = 'cid={cid}&player=1&quality=0{SECRETKEY}'.format(cid = cid, SECRETKEY = SECRETKEY)
    url = 'http://live.bilibili.com/api/playurl?cid={cid}&player=1&quality=0&sign={sign}'.format(cid = cid, sign = calc_sign(str_to_hash))
    HEADER = {
        'User-Agent':'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36',
    'Referer': 'http://live.bilibili.com/' + str(cid),
    'X-Requested-With': 'ShockwaveFlash/18.0.0.209'}
    request = urllib2.Request(url)
    response = urllib2.urlopen(request)
    data = response.read()
    #print(data)
    return str(xmltodict.parse(data)['video']['durl']['url'])
    
    


def get_flash_live_address_from_cid(cid):
    str_to_hash = 'cid={cid}&player=1&quality=0{SECRETKEY}'.format(cid = cid, SECRETKEY = SECRETKEY)
    a = 'http://live.bilibili.com/api/playurl?cid={cid}&player=1&quality=0&sign={sign}'.format(cid = cid, sign = calc_sign(str_to_hash))
    return a

print( get_flash_live_address_from_cid("7076936") )
    
