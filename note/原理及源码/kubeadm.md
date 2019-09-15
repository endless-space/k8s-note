# Kubeadm

```bash
打印默认配置： kubeadm config print init-default >> kubeadm.yaml

修改配置

kubeadm init --config=kubeadm.yaml

kubeadm join ...
```



1, kubeadm运行过程

​	Preflight Checks

​	==> /etc/kubernetes/

​	生成证书 

​	其他组件访问 apiserver配置

​	master组件生成Pod配置

​	生成Bootstrap Token



