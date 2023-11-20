#!/bin/bash

# 设置一个测试文件的URL
test_file_url="https://www.baidu.com/img/flexible/logo/pc/index.png"

# 设置下载超时时间为1秒
timeout=1

# 尝试下载文件
if wget --timeout=${timeout} --spider ${test_file_url} 2>/dev/null; then
  echo "系统已联网，正常退出脚本。"
  exit 0
else
  echo "下载失败，执行 portal.sh 脚本。"
 sleep 1

Uip=$(ifconfig | grep -A1 "eth1" | grep 'inet addr' | awk -F ':' '{print $2}' | awk '{print $1}')
Umac="aa:bb:cc:fa:ee:66"
User="123456"
Password="123456"


curl 'http://10.10.10.10/API_Login_SXZ.action' \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H "Cookie: JSESSIONID=0bd66b5f-a5eb-4586-886d-c6be536de1f2; mac=${Umac}" \
  -H 'Origin: http://10.10.10.10' \
  -H "Referer: http://10.10.10.10/zzzyxy/html/auth.html?yzm=0&wlanacname=ZZZYJSXY&wlanacip=10.20.0.1&wlanuserip=${Uip}&mac=${Umac}&url=" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data-raw "usr=${User}&pwd=${Password}&basip=10.20.0.1&ip=${Uip}&umac=4e%3A19%3A04%3A42%3Aa1%3Aaf&apmac=&ssid=&sn=%E9%83%91%E5%B7%9E%E8%81%8C%E4%B8%9A%E6%8A%80%E6%9C%AF%E5%AD%A6%E9%99%A2" \
  --compressed \
  --insecure


curl 'http://10.10.10.10/customerlogin.action' \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H "Cookie: JSESSIONID=0bd66b5f-a5eb-4586-886d-c6be536de1f2; mac=${Umac}" \
  -H 'Origin: http://10.10.10.10' \
  -H "Referer: http://10.10.10.10/zzzyxy/html/auth.html?yzm=0&wlanacname=ZZZYJSXY&wlanacip=10.20.0.1&wlanuserip=${Uip}&mac=${Umac}&url=" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data-raw "usr=${User}&pwd=${Password}&basip=10.20.0.1&ip=${Uip}&umac=4e%3A19%3A04%3A42%3Aa1%3Aaf&apmac=&ssid=&sn=%E9%83%91%E5%B7%9E%E8%81%8C%E4%B8%9A%E6%8A%80%E6%9C%AF%E5%AD%A6%E9%99%A2" \
  --compressed \
  --insecure



curl 'http://10.10.10.10/customerlogin.action' \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H "Cookie: JSESSIONID=0bd66b5f-a5eb-4586-886d-c6be536de1f2; mac=${Umac}" \
  -H 'Origin: http://10.10.10.10' \
  -H "Referer: http://10.10.10.10/zzzyxy/html/auth.html?yzm=0&wlanacname=ZZZYJSXY&wlanacip=10.20.0.1&wlanuserip=${Uip}&mac=${Umac}&url=" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data-raw "usr=${User}&pwd=${Password}&basip=10.20.0.1&ip=${Uip}&umac=4e%3A19%3A04%3A42%3Aa1%3Aaf&apmac=&ssid=&sn=%E9%83%91%E5%B7%9E%E8%81%8C%E4%B8%9A%E6%8A%80%E6%9C%AF%E5%AD%A6%E9%99%A2" \
  --compressed \
  --insecure
fi
