# OpenLDAP on K8s

在建立CI/CD流水线的过程, Gitlab, Jenkins, Nexus, Harbor等系统需采用统一的认证登录数据源.

这里以OpenLDAP作为统一的数据源服务器, 本文主要记录openldap部署至k8s过程.

前提: 提前确定存储方案, 这里以ceph为例.