## Task 5

### Module 5 Linux Networking

Initial settings in VirtualBox:  
![t5](./01.png)  
![t5](./02.png)
![t5](./03.png)  
Added static route to the router
![t5](./04.png)  
1. Static IP configuration on Server_1  
![t5](./06.png)  
To apply changes: sudo netplan apply.  
Configure static ip on Client_1:  
![t5](./061.png)  
Configure static ip on Client_2:  
![t5](./062.png)
2. Configure DHCP for int1 Client1, Client2  
First, we need to install it by:  
sudo apt install isc-dhcp-server  
To specify interfaces we go to /etc/default/isc-dhcp-server  
![t5](./07.png)  
After that go to /etc/dhcp/dhcpd.conf and edit it  
![t5](./08.png)  
To apply changes we need to restart dhcpd service by using:  
sudo systemctl restart isc-dhcp-server.service
Next we need to configure DHCP client.  
For Centos 9:
nmcli connection modify enp0s3 ipv4.method auto
nmcli connection down enp0s3; nmcli connection up enp0s3
For Ubuntu:
![t5](./09.png)  
After that restart: sudo systemctl restart NetworkManager.service
To show leased IP addresses: dhcp-lease-list command on the server:  
![t5](./10.png)  
To check if the IP forwarding is active on the server:
cat /proc/sys/net/ipv4/ip_forward    
if the result is 0 - we should enable it. first - edit /etc/sysctl.conf  
![t5](./11.png)  
sysctl -p /etc/sysctl.conf - to enable the adjusted settings (-p - to load the configuration file)
next - restart proc file system:  
/etc/init.d/procps restart  
![t5](./12.png)  
3. Check connection between virtual machines:  
We are able to connect between virtual machines because of configuring default gateways and directly connected interfaces.  
We are also able to ping for example 8.8.8.8 because we have added a default route (for it to be able to know where to send traffic to 10.*.*.* networks) on our router for the ping to be able to come back. 
Ping from server:  
![t5](./13.png)  
traceroute from server:  
![t5](./14.png)  
Ping from Client1:  
![t5](./15.png)  
traceroute from Client1:  
![t5](./16.png)  
Ping from Client2:  
![t5](./17.png)    
![t5](./19.png)  
traceroute from Client2:  
![t5](./18.png)
4. We configure 2 ip addresses on lo interface:   
![t5](./23.png)  
To make the traffic to go from Client2 to 172.17.16.1 through Server1 configure Client2:  
![t5](./24.png)    
And Server1  
![t5](./25.png)  
Now, the traffic from Client2 to 172.17.16.1 goes through Server1:  
![t5](./26.png)  
To make the traffic to go from client 2 to 172.17.26.1 through Net4:  
![t5](./27.png)
5. Summary static routes for 172.17.16.1 and 172.17.26.1:  
![t5](./28.png)  
Delete previously added routes by using sudo ip route del  
![t5](./29.png)  
Add summarized route to Server1:  
![t5](./30.png)  
And Client2, now we can test our configuration using traceroute  
![t5](./31.png)
6. Configure SSH. First, check if there is Openssh installed on all our virtual machines:  
![t5](./32.png)  
Connect from Client1 to the Server:  
![t5](./33.png)  
Connect from Client2 to the Server:  
![t5](./34.png)  
And finally from Client1 to Client2:  
![t5](./35.png)
7. We should configure Server1 firewall:
* To allow SSH from Client1 and deny from Client2.  
   sudo iptables -A INPUT -i enp0s9 -p tcp --dport 22 -j DROP    
   sudo iptables -A INPUT -p tcp --dport ssh -j ACCEPT  
![t5](./36.png)  
* To allow ping from 172.17.16.1 and deny ping from 172.17.26.1:  
   sudo iptables -A OUTPUT -p icmp -d 172.17.26.1 -j REJECT  
  ![t5](./37.png)
8. I've deleted static routing settings from my routes, so we cannot fe ping 8.8.8.8:  
![t5](./38.png)  
Configure Server1 with:  
sudo iptables -A POSTROUTING -t nat -j MASQUERADE  
![t5](./39.png)