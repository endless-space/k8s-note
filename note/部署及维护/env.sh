#!/usr/bin/env bash

function hosts() {
  cat >> /etc/hosts <<EOF
192.168.100.100 k8s-case-1-master
192.168.100.101 k8s-case-1-node1
192.168.100.102 k8s-case-1-node2
EOF
}

function updatepkg() {
  yum makecache fast
  yum -y install wget yum-utils

  if [ ! -d "/etc/yum.repos.d/" ]; then
    mkdir -p /etc/yum.repos.d/
  fi
  cd /etc/yum.repos.d/
  wget http://mirrors.aliyun.com/repo/Centos-7.repo
  if [ -f "CentOs-Base.repo" ]; then
    mv CentOs-Base.repo CentOs-Base.repo.bak
  fi
  mv Centos-7.repo CentOs-Base.repo
  yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
  

  yum clean all
  yum makecache fast

  yum install -y epel-release
  yum install -y conntrack ntpdate ntp ipvsadm ipset jq iptables curl sysstat libseccomp wget device-mapper-persistent-data lvm2 bash-completion
}

function datetimecfg() {
  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
  timedatectl set-timezone Asia/Shanghai
  timedatectl set-local-rtc 0

  systemctl restart rsyslog
  systemctl restart crond

  systemctl start ntpd
  systemctl enable ntpd
  ntpdate -u cn.pool.ntp.org
}

function closeswap() {
  swapoff -a
  sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
}

function closeselinux() {
  setenforce 0
  sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
}

function netfiltercfg() {
  systemctl disable firewalld.service 
  systemctl stop firewalld.service

  iptables -F && iptables -X && iptables -F -t nat && iptables -X -t nat
  iptables -P FORWARD ACCEPT

  modprobe ip_vs_rr
  modprobe br_netfilter
}

function kernelcfg() {
  cat > /etc/sysctl.d/kubernetes.conf <<EOF
net.bridge.bridge-nf-call-iptables=1
net.bridge.bridge-nf-call-ip6tables=1
net.ipv4.ip_forward=1
net.ipv4.tcp_tw_recycle=0
vm.swappiness=0
vm.overcommit_memory=1
vm.panic_on_oom=0
fs.inotify.max_user_instances=8192
fs.inotify.max_user_watches=1048576
fs.file-max=52706963
fs.nr_open=52706963
net.ipv6.conf.all.disable_ipv6=1
net.netfilter.nf_conntrack_max=2310720
EOF
  sysctl -p /etc/sysctl.d/kubernetes.conf
}

function docker() {
  if [ ! -d "/etc/docker" ]; then
    mkdir -p /etc/docker
  fi
  
  cat > /etc/docker/daemon.json <<EOF
{
  "registry-mirrors" : ["http://2595fda0.m.daocloud.io"],
  "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF

  yum install -y docker-ce-18.06.3.ce-3.el7
  systemctl daemon-reload
  systemctl enable docker
  systemctl start docker
}

function kubernetes() {
  cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF
  yum install -y kubelet kubeadm kubectl
  systemctl enable kubelet && systemctl start kubelet
}

updatepkg
hosts
datetimecfg
closeswap
closeselinux
netfiltercfg
kernelcfg
docker
kubernetes
