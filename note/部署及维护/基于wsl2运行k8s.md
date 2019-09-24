# K8s in wsl2

1. 更新win10最新版, 开启对应特性

   wsl

   Powershell(管理员): Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

   hyper-v

2. 安装docker
3. 安装kind

* 这个操作由于会启用hyper-v, 将导致本机的virtualbox和vmware不能正常使用.
	bcdedit /set hypervisorlaunchtype off #恢复