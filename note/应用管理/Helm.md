# Helm

##### helm, 一个k8s包管理工具.

#### 基本概念:

- Chart: 一个k8s应用包, 包含了应用的资源清单.

- Repository: Chart仓库.

- Release: 一个Chart实例.



#### 部署维护:

1. helm init (注意权限, RBAC配置)
2. docker pull gcr.io/kubernetes-helm/tiller:v2.14.3 -> docker pull gcr.azk8s.cn/kubernetes-helm/tiller:v2.14.3
3. docker tag IMAGEID(镜像id) REPOSITORY:TAG
4. helm install stable/mysql #注意先准备好默认的storageClass, rook

