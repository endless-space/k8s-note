# Kubernetes 学习笔记

> 笔记用于知识组织, 语言尽量精炼, 直达问题核心, 提供关键操作关联资源, 不是教程

1. ### Kubernetes 基本概念

   1. Kubernetes基本架构 及 系统组件

      Kubernetes(k8s)是一个容器**应用管理**系统, 用于帮助用户自动化的完成大部分应用及其基础设施管理工作.

      Kubernetes一方面对底层基础设施资源, 包括主机, 网络, 存储等进行抽象, 向应用层暴露一个资源池; 另一方面对应用层的可容器化应用进行自动化的管理, 包括但不限与编排, 调度, 部署, 自动伸缩, 滚动更新, 故障恢复等; 更进一步对微服务架构应用提供了部分基本的服务治理功能, 包括服务注册与发现, 配置管理, 反向代理及软负载均衡等.

      

   2. Kubernetes API

      Kubernetes对外暴露了一组声明式API, 用于用户访问系统功能. 该组API由kube-apiserver进程以restful接口的形式提供, 其核心就是一组资源对象, Kubernetes利用这组资源对象完成了对基础设施, 应用管理任务及其他功能的抽象. 使用Kubernetes的功能实际上就是完成对这些资源对象的增删查改.

2. ### Kubernetes 部署及维护

   1. Kubernetes部署

      全部基于Linux环境部署与维护, 为了记录方便不考虑其他环境

   2. Kubernetes安全管理

   3. Kubernetes网络管理

   4. Kubernetes存储管理

   5. 故障排查定位

3. ### 基于Kubernetes的应用管理

   1. Pod
   2. Service
   3. Deployment & ReplicaSet
   4. StatefulSet
   5. DaemonSet
   6. Job & CronJob
   7. Ingress

4. ### 基于Kubernetes API的扩展开发

   1. CRD & Operator
   2. 基于Java的扩展开发
   3. 基于Go的扩展开发

5. ### Kubernetes原理 及 源码分析

   1. 容器
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

   

      

