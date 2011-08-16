#!/bin/bash  
# on definit les variables:

IPT="/sbin/iptables"
IFACE=$(route | grep default | awk '{print $8}')

# adresse IP

MOI=$(ifconfig $IFACE | grep Masque | cut -d":" -f2 | cut -d" " -f1)
MASK=$(ifconfig $IFACE | grep Masque | cut -d":" -f4 | cut -d" " -f1)
GW=$(route -n | grep UG | awk '{print $2}')

# ports

MULE_TCP="3000"
MULE_UDP="3010"


flush(){
    $IPT -F
    $IPT -X

    echo "purge des tables			[ok]"
}

stop() {
    $IPT -P INPUT ACCEPT
    $IPT -P OUTPUT ACCEPT
    $IPT -P FORWARD ACCEPT

    echo "arret du firewall			[ok]"
}

start() {
    $IPT -P INPUT DROP
    $IPT -P OUTPUT DROP
    $IPT -P FORWARD DROP

    $IPT -A INPUT -i lo -j ACCEPT
    $IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT 		# autorise les connexion deja établies

    $IPT -A OUTPUT -o lo -j ACCEPT
    $IPT -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT 		# autorise les connexion deja établies
    $IPT -A OUTPUT -p udp --dport 67:68 -j ACCEPT				# autorise le dhcp

    echo ""
    echo "mode dhcp, seule les requetes dhcp sont autorisees"
    echo ""
}

mitm() {
    echo 1 > /proc/sys/net/ipv4/ip_forward
    $IPT -D FORWARD -j logdeny
    $IPT -A FORWARD -j ACCEPT
    echo "       !!!!!! mode man in the middle : autorise tout le FORWARD"
    echo ""
}

free() {
    $IPT -P INPUT DROP
    $IPT -P OUTPUT DROP
    $IPT -P FORWARD DROP

    echo "definition des politiques par defaut	[ok]"

    modprobe ip_conntrack 							# modules necessaire au suivit des conexions
    modprobe ip_conntrack_ftp

    echo "chargement des modules necessaires	[ok]"

    $IPT -N logdeny 							# creation de la chaine personnelle dediee au log

    # INPUT

    $IPT -A INPUT -i lo -j ACCEPT
    $IPT -A INPUT -i $IFACE -m state --state ESTABLISHED,RELATED -j ACCEPT 	# autorise les connexion deja établies
    $IPT -A INPUT -i $IFACE -p icmp --icmp-type host-unreachable -j ACCEPT 	# accept le icmp host-unreachable
    for DNS in $(grep ^n /etc/resolv.conf | awk '{print $2}'); 
    do
	$IPT -A INPUT -i $IFACE -s $DNS -p udp --sport 53 -j ACCEPT 	# autorise les reponses DNS d'apres resolv.conf
    done
    $IPT -A INPUT -i $IFACE -p tcp --dport $MULE_TCP -j ACCEPT 		# emule TCP
    $IPT -A INPUT -i $IFACE -p udp --dport $MULE_UDP -j ACCEPT 		# emule UDP
    $IPT -A INPUT -j logdeny 						# on envoie tout le reste au log

    echo "definition des regles INPUT		[ok]"

    # OUTPUT

    $IPT -A OUTPUT -o lo -j ACCEPT
    $IPT -A OUTPUT -o $IFACE -m state --state NEW -j ACCEPT 		# autorise les connexions initiees localement
    $IPT -A OUTPUT -o $IFACE -m state --state ESTABLISHED,RELATED -j ACCEPT # autorise les connexion deja établies

    echo "definition des regles OUTPUT		[ok]"
    # FORWARD

    $IPT -A FORWARD -j logdeny # on envoie tout le reste au log

    echo "definition des regles FORWARD (drop)	[ok]"

    $IPT -t filter -A logdeny -s $MOI -j LOG --log-prefix "firewall [drop out]: "
    $IPT -t filter -A logdeny -s ! $MOI -j LOG --log-prefix "firewall [drop in]: "
    $IPT -t filter -A logdeny -j DROP

    echo "mise en place des logs			[ok]"

    echo 1 > /proc/sys/net/ipv4/tcp_syncookies
    echo 0 > /proc/sys/net/ipv4/ip_forward
    echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
    echo 1 >/proc/sys/net/ipv4/conf/all/log_martians
    echo 0 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
    echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
    echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects
    echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route

    echo "autres protections reseau		[ok]"
    echo ""
}

strict() {

    $IPT -P INPUT DROP
    $IPT -P OUTPUT DROP
    $IPT -P FORWARD DROP

    echo "definition des politiques par defaut	[ok]"

    modprobe ip_conntrack # modules necessaire au suivit des conexions
    modprobe ip_conntrack_ftp

    echo "chargement des modules necessaires	[ok]"

    $IPT -N logdeny # creation de la chaine personnelle dediee au log

    # INPUT

    $IPT -A INPUT -i lo -j ACCEPT
    $IPT -A INPUT -i $IFACE -m state --state ESTABLISHED,RELATED -j ACCEPT # autorise les connexion deja établies
    $IPT -A INPUT -i $IFACE -p icmp --icmp-type host-unreachable -j ACCEPT # accept le icmp host-unreachable
    for DNS in $(grep ^n /etc/resolv.conf | awk '{print $2}'); 
    do
	$IPT -A INPUT -i $IFACE -s $DNS -p udp --sport 53 -j ACCEPT # autorise les reponses DNS d'apres resolv.conf
    done
    $IPT -A INPUT -j logdeny # on envoie tout le reste au log
    
    echo "definition des regles INPUT		[ok]"
    
    # OUTPUT
    
    $IPT -A OUTPUT -o lo -j ACCEPT
    $IPT -A OUTPUT -o $IFACE -m state --state ESTABLISHED,RELATED -j ACCEPT # autorise les connexion deja établies
    $IPT -A OUTPUT -o $IFACE -p icmp --icmp-type echo-request -j ACCEPT 	# autorise a envoyer des pings
    $IPT -A OUTPUT -o $IFACE -p udp --dport 67 -j ACCEPT 			# dhcp
    $IPT -A OUTPUT -o $IFACE -p tcp --dport 80 --syn -j ACCEPT 		# http
    $IPT -A OUTPUT -o $IFACE -p tcp --dport 443 --syn -j ACCEPT 		# https
    $IPT -A OUTPUT -o $IFACE -p tcp --dport 21 --syn -j ACCEPT 		# ftp
    $IPT -A OUTPUT -o $IFACE -p tcp --dport 115 --syn -j ACCEPT 		# sftp
    $IPT -A OUTPUT -o $IFACE -p tcp --dport 110 --syn -j ACCEPT 		# pop
    $IPT -A OUTPUT -o $IFACE -p udp --dport 110 -j ACCEPT 			# pop
    $IPT -A OUTPUT -o $IFACE -p tcp --dport 995 --syn -j ACCEPT		# spop
    $IPT -A OUTPUT -o $IFACE -p udp --dport 995 -j ACCEPT 			# spop
    $IPT -A OUTPUT -o $IFACE -p tcp --dport 25 --syn -j ACCEPT 		# smtp
    $IPT -A OUTPUT -o $IFACE -p tcp --dport 465 --syn -j ACCEPT 		# ssmtp
    $IPT -A OUTPUT -o $IFACE -p tcp --dport 1863 --syn -j ACCEPT 		# msn
    $IPT -A OUTPUT -o $IFACE -p tcp --dport 5050 --syn -j ACCEPT 		# yahoo messenger
    $IPT -A OUTPUT -o $IFACE -p tcp --dport 22 --syn -j ACCEPT 		# ssh
    $IPT -A OUTPUT -o $IFACE -p tcp --dport 5900 --syn -j ACCEPT 		# vnc
    $IPT -A OUTPUT -o $IFACE -p tcp --dport 137:139 --syn -j ACCEPT 	# SMB
    $IPT -A OUTPUT -o $IFACE -p udp --dport 137:139 -j ACCEPT 		# SMB
    $IPT -A OUTPUT -o $IFACE -p tcp --dport 445 --syn -j ACCEPT 		# SMB
    $IPT -A OUTPUT -o $IFACE -p udp --dport 445 -j ACCEPT 			# SMB
    $IPT -A OUTPUT -o $IFACE -p tcp --dport 3990 --syn -j ACCEPT 		# Authentification (Radius)
    
    for DNS in $(grep ^n /etc/resolv.conf | awk '{print $2}'); 
    do
	$IPT -A OUTPUT -o $IFACE -d $DNS -p udp --dport 53 -j ACCEPT # autorise les requetes DNS
    done
    
    $IPT -A OUTPUT -j logdeny # on envoie tout le reste au log
    
    echo "definition des regles OUTPUT		[ok]"
    
    # FORWARD
    
    $IPT -A FORWARD -j logdeny # on envoie tout le reste au log
    
    echo "definition des regles FORWARD (drop)	[ok]"
    
    $IPT -t filter -A logdeny -s $MOI -j LOG --log-prefix "firewall [drop out]: "
    $IPT -t filter -A logdeny -s ! $MOI -j LOG --log-prefix "firewall [drop in]: "
    $IPT -t filter -A logdeny -j DROP
    
    echo "mise en place des logs			[ok]"
    
    echo 1 > /proc/sys/net/ipv4/tcp_syncookies
    echo 0 > /proc/sys/net/ipv4/ip_forward
    echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
    echo 1 >/proc/sys/net/ipv4/conf/all/log_martians
    echo 0 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
    echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
    echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects
    echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
    
    echo "autres protections reseau		[ok]"
    echo ""
    
}

echo ""
echo "info configuration :"
echo ""
echo interface active : $IFACE
echo adresse ip de $IFACE : $MOI
echo masque reseau $IFACE : $MASK
echo adresse de la passerelle : $GW
for DNS in $(grep ^n /etc/resolv.conf | awk '{print $2}'); 
do
    echo adresse du serveur de noms : $DNS
done
echo ""

case "$1" in
    start)
        flush && start
        ;;
    stop)
        flush && stop
        ;;
    restart)
        flush && strict
        ;;
    mitm)
	flush && free && mitm
	;;
    free)
	flush && free
	;;
    strict)
	flush && strict
	;;
    *)
        echo "Usage: /etc/init.d/firewall {start|strict|restart|mitm|free|stop}"
        exit 1
        ;;
esac

exit 0
