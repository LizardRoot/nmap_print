# port_scan_for_webcam
This is script for scaning ips working with ip-cam.
After starting the script displays the result of execution in the terminal. 
In fact, you can use any ports.


For run script:
1) Create the file "ips.txt".
2) Write in "ips.txt" addresses in the format CIDR (ip/mask).
3) Required: bash , nmap , grep , awk/

Functional:
After entering the number of ports from 1 to 4, if you want to use more ports, enter “+”. If you entered "+", specify the number of ports to scan, then specify the port numbers. The result will be the work will be in the terminal and in the file that you specified at the beginning.

Recommendations:

To date, 01/15/2019:

XM/JUFENG - Port numbers: TCP port (34567), HTTP port (80), ONVIF port (8899).
HIKVISION - Port numbers: HTTP port (80), RTSP port (554), HTTPS (443), Service port (8000), ONVIF port (80).
DAHUA - Port numbers: TCP port (37777), UDP port (37778), http port (80), RTSP (554), HTTPS (443), ONVIF (default is closed, 80).
TOPSEE - Port numbers: http (80), data port (8091) RTSP port (554) ONVIF port (80).
JOVISION - 8554
GWELL/YOOSEE - 554, ONVIF port: 5000; open port: 3702
V380 - 8899
UNIVIEW - Port numbers: HTTP (80), RTSP (554), HTTPS (110/443), ONVIF port (80)
TIANDY - ONVIF port number (8080)

554 - "RTSP"
8000 - service port
8091 - data port
8899 - "ONVIF"