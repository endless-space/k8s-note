# Kubernetes 学习笔记

> 笔记用于知识组织, 语言尽量精炼, 直达问题核心并提供关键操作关联资源. 不是教程

1. ### Kubernetes 基本概念

   1. ##### 核心理念

      Kubernetes(k8s)是一个容器**应用管理**系统, 用于帮助用户自动化的完成大部分应用及其基础设施管理工作.

      Kubernetes一方面对底层基础设施资源, 包括主机, 网络, 存储进行抽象, 向应用层暴露一个资源池; 另一方面对应用层的可容器化应用进行自动化的管理, 包括但不限于编排, 调度, 部署, 自动伸缩, 滚动更新, 故障恢复等; 更进一步对微服务架构应用提供了部分基本的服务治理功能, 包括服务注册与发现, 配置管理, 反向代理及软负载均衡等.

      **用户声明期望状态, 系统自动对实际状态进行收敛并最终符合期望状态** 的核心理念.

   2. ##### Kubernetes基本架构 及 系统组件

      kubernetes主机集群逻辑上分为master节点和node节点. master节点是集群全局管控节点. node节点是集群工作负载管理及实际负载运行节点. 二者分别运行着若干kubernetes组件进程用于实现对应节点角色的功能.在master节点上运行着:

      ​	etcd: 分布式一致性kv存储解决方案, 主要用于存储k8s资源对象定义.

      ​	kube-apiserver: 集群功能接口访问入口, 集群通信中枢.

      ​	kube-controller-manager: 控制器集合, 调整资源对象的实际状态以期符合用户提交的预期状态.

      ​	kube-scheduler: 决定新Pod运行于哪个node节点.

      在node上运行着:

      ​	kubelet: Pod声明周期管理, 向apiserver上报node, pod等状态

      ​	kube-proxy: 集群流量管理, 用于为应用提供方向代理, ipvs, iptables, userspace proxy

      另外集群中还可能运行一些其他Addon进程以提供额外功能:

      ​	core-dns: dns服务

      ​	dashboard: 为k8s功能访问提供web ui

   3. ##### Kubernetes API

      Kubernetes对外暴露了一组声明式API, 用于用户访问系统功能. 该组API由kube-apiserver进程以restful接口的形式提供, 其核心就是一组资源对象, Kubernetes利用这组资源对象完成了对基础设施, 应用管理任务及其他功能的抽象. 使用Kubernetes的功能实际上就是完成对这些资源对象的增删查改.

      基本资源对象包括:

      ​	Node: 集群节点

      ​	Namespace: 多租户资源隔离机制

      ​	Pod: 应用, 容器组

      ​	Volume: 存储卷

      ​	Service: 服务, 一组应用副本访问入口

      常用控制器资源对象:

      ​	Deployment & ReplicaSet: 无状态应用管理

      ​	StatefulSet: 有状态应用管理

      ​	DaemonSet: 每Node后台服务管理

      ​	Job & CornJob: 批处理任务及定时任务管理

2. ### Kubernetes 部署及维护

   1. [Kubernetes部署](./note/部署及维护)

      全部基于Linux环境部署与维护, 为了记录方便不考虑其他环境

   2. kubectl

   3. Kubernetes安全管理

      基于双向认证的https通信

      RBAC

      准入任务管理

   4. Kubernetes网络管理

      flannel

   5. Kubernetes存储管理

      Volume, PersistenceVolume, PersistenceVolumeClaim, StorageClass, **rook项目**

   6. 监控

      prometheus

   7. 日志

      efk

   8. 故障排查定位

      kube-debug

      各系统组件日志

3. ### 基于Kubernetes的应用管理

   1. Pod: 容器声明周期, 存活及就绪探针, 资源分配
   2. Service: ClusterIP, NodePort, LoadBalancer, Headless service
   3. Deployment & ReplicaSet
   4. StatefulSet
   5. DaemonSet
   6. Job & CronJob
   7. Ingress

4. ### 基于Kubernetes API的扩展开发

   1. CRD
   2. Admission Control

5. ### Kubernetes原理 及 源码分析

   1. 容器, docker, 容器运行时
   2. kubeadm
   3. ectd
   4. kube-apiserver
   5. kube-controller-manager
   6. kube-scheduler
   7. kubelet
   8. kube-proxy

6. ### 面向Kubernetes的应用设计

   1. spring-cloud-kubernetes
   2. istio

7. ### Kubernetes实践案例

   基于kubernetes的devops流水线

   gitops实践

   各大企业是如何利用k8s解决开发, 测试, 部署问题的





