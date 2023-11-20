# zzyportal
适用于郑州职业技术学院校园网的自动登录Portal脚本，可以用来破解校园网终端限制。
原理是使用脚本在路由器上实现自动登录，然后路由器充当终端。

## 准备工作&基础信息
①支持刷openwrt的任何路由器，这里使用的是Xiaomi WR30U。  
②一根网线，从校园网AP连接到你的路由器。  
③一点点linux基础。  

## 获得Portal参数
打开校园网认证页面，按F12调出开发者选项，切换到网络选项卡，这时点击登录后右侧会立即出现三个新的数据流"API_Login_SXZ.action","customerlogin.action","customerlogin.action"。右键→复制→复制为cURL(bash)。这里注意一定要选择复制为cURL(bash);新建sh文件将他们依次粘贴进去。
## 获得终端ip参数
OpenWrt中获取IP地址的命令  
```ifconfig | grep -A1 "eth0.2" | grep 'inet addr' |awk -F ':' '{print $2}'|awk '{print $1}' ```  
  每个人网卡配置不一样，注意要把中间的eth0.2换成你对应的网卡。下文中我换成了eth1。
## 稍微修改一下增加ip地址，mac地址，用户名，密码等参数。
就结束了，下面是成品。注意该脚本仅供参考，里面的用户名/密码等参数均为虚拟。  
```
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
  -H "Cookie: JSESSIONID=c5e4a3c8-d2ed-496b-a94e-aabffcde7be0; mac=${Usermac}" \
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
  -H "Cookie: JSESSIONID=c5e4a3c8-d2ed-496b-a94e-aabffcde7be0; mac=${Usermac}" \
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
  -H "Cookie: JSESSIONID=c5e4a3c8-d2ed-496b-a94e-aabffcde7be0; mac=${Usermac}" \
  -H 'Origin: http://10.10.10.10' \
  -H 'Pragma: no-cache' \
  -H "Referer: http://10.10.10.10/zzzyxy/html/auth.html?yzm=0&wlanacname=ZZZYJSXY&wlanacip=10.15.0.1&wlanuserip=${Userip}&mac=${Usermac}&url=" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data-raw "usr=${User}&pwd=${Password}&basip=10.15.0.1&ip=${Userip}&umac=6c%3A24%3A08%3A18%3A25%3Ab2&apmac=&ssid=&sn=%E9%83%91%E5%B7%9E%E8%81%8C%E4%B8%9A%E6%8A%80%E6%9C%AF%E5%AD%A6%E9%99%A2" \
   \
```
另外的话可以加入网络检测部分，如果检测到网络不通那么便执行。
```
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
  -H "Cookie: JSESSIONID=c5e4a3c8-d2ed-496b-a94e-aabffcde7be0; mac=${Usermac}" \
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
  -H "Cookie: JSESSIONID=c5e4a3c8-d2ed-496b-a94e-aabffcde7be0; mac=${Usermac}" \
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
  -H "Cookie: JSESSIONID=c5e4a3c8-d2ed-496b-a94e-aabffcde7be0; mac=${Usermac}" \
  -H 'Origin: http://10.10.10.10' \
  -H 'Pragma: no-cache' \
  -H "Referer: http://10.10.10.10/zzzyxy/html/auth.html?yzm=0&wlanacname=ZZZYJSXY&wlanacip=10.15.0.1&wlanuserip=${Userip}&mac=${Usermac}&url=" \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 Edg/119.0.0.0' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data-raw "usr=${User}&pwd=${Password}&basip=10.15.0.1&ip=${Userip}&umac=6c%3A24%3A08%3A18%3A25%3Ab2&apmac=&ssid=&sn=%E9%83%91%E5%B7%9E%E8%81%8C%E4%B8%9A%E6%8A%80%E6%9C%AF%E5%AD%A6%E9%99%A2" \
   \ >> /etc/zzyportal/portal.log

echo ""  >> /etc/zzyportal/portal.log

fi
```
 
## 注意
将脚本丢入openwrt中，使用corntab运行即可，但频率不要太频繁。
## 参考
[OpenWrt自动登录Portal脚本](https://www.cnblogs.com/lxnchan/p/14988207.html)   
[一种在openwrt路由器突破校园网web认证设备限制的方法](https://blog.csdn.net/liberal_wind/article/details/89882777)
## 特别感谢
在具体实践中，出现了很多问题，在好友 乐航 的大力支持下本项目才得以成功运行，在此表示感谢。  
