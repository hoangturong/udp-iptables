iptables -I INPUT -p udp --dport 16000:29000 -m string --to 75 --algo bm --string 'HTTP/1.1 200 OK' -j DROP
iptables -I INPUT -p udp -m udp -m string --hex-string "|7374640000000000|" --algo kmp --from 28 --to 29 -j DROP
iptables -A INPUT -p udp -m u32 --u32 "6&0xFF=0,2:5,7:16,18:255" -j DROP
iptables -A INPUT -m u32 --u32 "12&0xFFFF=0xFFFF" -j DROP
iptables -A INPUT -m u32 --u32 "28&0x00000FF0=0xFEDFFFFF" -j DROP
iptables -A INPUT -m string --algo bm --from 28 --to 29 --string "farewell" -j DROP
iptables -A INPUT -p udp -m u32 --u32 "28 & 0x00FF00FF = 0x00200020 && 32 & 0x00FF00FF = 0x00200020 && 36 & 0x00FF00FF = 0x00200020 && 40 & 0x00FF00FF = 0x00200020" -j DROP
iptables -I INPUT -p udp -m udp -m string --hex-string "|53414d50|" --algo kmp --from 28 --to 29 -j DROP
iptables -A PREROUTING -t raw -p udp --dport 9987 -m length --length 0:32 -j DROP
iptables -A PREROUTING -t raw -p udp --dport 9987 -m length --length 2521:65535 -j DROP
iptables -A PREROUTING -t raw -p udp --dport 9987 -m length --length 98 -j DROP