# Operator开发

1. golang环境搭建(go1.12.9)

2. 安装kubebuilder, kustomize

   kubebuilder: 基于CRD的扩展开发工具

   kustomize: yaml资源清单模版工具

3. 创建go mod

   1. go mod init infinite.com/x/Item

4. 生成基本项目

   1. kubebuilder init --domain infinite.com # make run
   2. kubebuilder create api --group x --version v1 --kind Item --namespaced fasle

5. 根据业务规则修改CRD定义, 控制器

   修改代码解决
