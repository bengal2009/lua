st=x..y.."11"..z
print(st)

print("POST /v1.0/device/".."21817".."/sensor/".."156585".."/datapoints HTTP/1.1\r\n"
.."Host: www.yeelink.net\r\n"
.."Content-Length: "..string.len(st).."\r\n"--the length of json is important
.."Content-Type: application/x-www-form-urlencoded\r\n"
.."U-ApiKey:".."a96dce4941692401fe58b2a6d9fa2936".."\r\n"
.."Cache-Control: no-cache\r\n\r\n"
..st.."\r\n" )