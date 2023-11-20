#!/bin/bash

test_file_url="https://www.baidu.com/img/flexible/logo/pc/result.png"

timeout=1

if wget --timeout=${timeout} --spider ${test_file_url} 2>/dev/null; then
  
  echo "系统已联网，正常退出脚本。"
  exit 0
else

  echo "============New Login===============" >> /etc/zzyportal/portal.log
  date +'%Y/%m/%d %H:%M:%S'  >> /etc/zzyportal/portal.log

  Userip=$(ifconfig | grep -A1 "eth1" | grep 'inet addr' | awk -F ':' '{print $2}' | awk '{print $1}')
  Usermac="aa:bb:2f:88:11:22"
  User="123456"
  Password="123456"

  curl 'http://10.10.10.10/API_Login_SXZ.action' \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H "Cookie: JSESSIONID=d1a53f28-516b-414a-b32a-22c323e99f9e; mac=${Usermac}" \
  -H 'Origin: http://10.10.10.10' \
  -H 'Pragma: no-cache' \
  -H "Referer: http://10.10.10.10/zzzyxy/html/auth.html?yzm=0&wlanacname=ZZZYJSXY&wlanacip=10.15.0.1&wlanuserip=${Userip}&mac=${Usermac}&url=" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data-raw "usr=${User}&pwd=${Password}&basip=10.15.0.1&ip=${Userip}&umac=6c%3A24%3A08%3A18%3A25%3Ab2&apmac=&ssid=&sn=%E9%83%91%E5%B7%9E%E8%81%8C%E4%B8%9A%E6%8A%80%E6%9C%AF%E5%AD%A6%E9%99%A2" \
   \
  

  curl 'http://10.10.10.10/customerlogin.action' \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H "Cookie: JSESSIONID=d1a53f28-516b-414a-b32a-22c323e99f9e; mac=${Usermac}" \
  -H 'Origin: http://10.10.10.10' \
  -H 'Pragma: no-cache' \
  -H "Referer: http://10.10.10.10/zzzyxy/html/auth.html?yzm=0&wlanacname=ZZZYJSXY&wlanacip=10.15.0.1&wlanuserip=${Userip}&mac=${Usermac}&url=" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data-raw "usr=${User}&pwd=${Password}&basip=10.15.0.1&ip=${Userip}&umac=6c%3A24%3A08%3A18%3A25%3Ab2&apmac=&ssid=&sn=%E9%83%91%E5%B7%9E%E8%81%8C%E4%B8%9A%E6%8A%80%E6%9C%AF%E5%AD%A6%E9%99%A2" \
   \
  

  curl 'http://10.10.10.10/customerlogin.action' \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H "Cookie: JSESSIONID=d1a53f28-516b-414a-b32a-22c323e99f9e; mac=${Usermac}" \
  -H 'Origin: http://10.10.10.10' \
  -H 'Pragma: no-cache' \
  -H "Referer: http://10.10.10.10/zzzyxy/html/auth.html?yzm=0&wlanacname=ZZZYJSXY&wlanacip=10.15.0.1&wlanuserip=${Userip}&mac=${Usermac}&url=" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data-raw "usr=${User}&pwd=${Password}&basip=10.15.0.1&ip=${Userip}&umac=6c%3A24%3A08%3A18%3A25%3Ab2&apmac=&ssid=&sn=%E9%83%91%E5%B7%9E%E8%81%8C%E4%B8%9A%E6%8A%80%E6%9C%AF%E5%AD%A6%E9%99%A2" \
   \ >> /etc/zzyportal/portal.log

echo ""  >> /etc/zzyportal/portal.log

fi
