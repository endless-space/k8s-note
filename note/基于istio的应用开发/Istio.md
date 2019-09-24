# Istio 

> ServiceMesh形态的服务治理系统. 区别于SpringCloud等类库形态的服务治理框架.

1. 安装

   下载分发包,  安装istio-init和istio:

   helm template . --name istio-xx --namespace istio-system : 

   ```
   configmap/istio-crd-10 created
   configmap/istio-crd-11 created
   configmap/istio-crd-12 created
   serviceaccount/istio-init-service-account created
   clusterrole.rbac.authorization.k8s.io/istio-init-istio-system created
   clusterrolebinding.rbac.authorization.k8s.io/istio-init-admin-role-binding-istio-system created
   job.batch/istio-init-crd-10-1.3.0 created
   job.batch/istio-init-crd-11-1.3.0 created
   job.batch/istio-init-crd-12-1.3.0 created
   ```

2. 测试

   安装example中的bookinfo案例