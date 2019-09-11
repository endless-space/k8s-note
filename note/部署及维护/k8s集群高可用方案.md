# k8s集群高可用方案

新建集群时, 需要充分做好规划.

主机规划:

​	master高可用, 3节点8C32G, 100GSSD

​	Node规划为64-128台左右

​	centos7.4 64 (linux内核, 4.2)

网络规划:

​	公有云用Flannel, 私有云用Calico

​	Pod 网络 CIDR

​	Service CIDR 

​	kube-proxy尽量使用ipvs模式

​	对于外部访问的服务, 尽量使用NodePort的方式暴露

安全规划:

​	apiserver尽量不要暴露公网, 安全漏洞多与此组件相关

​	设置namespace, 设置安全组, RBAC设置



参考资料:

https://github.com/easzlab/kubeasz

