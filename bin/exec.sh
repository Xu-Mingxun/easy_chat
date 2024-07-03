# Go
go mod init
go mod tidy

# proto，在根目录执行
goctl rpc protoc ./apps/user/rpc/user.proto --go_out=./apps/user/rpc/ --go-grpc_out=./apps/user/rpc/ --zrpc_out=./apps/user/rpc/

# deployment
# 先将程序编译成二进制可执行的文件
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o bin/user-rpc ./apps/user/rpc/user.go
# 然后根据二进制文件构建成镜像文件
docker build -t user-rpc -f ./dockerfile_rpc .
# 再修改构建的镜像标签
$ docker tag user-rpc registry.cn-hangzhou.aliyuncs.com/easy-chat/user-rpc-test:latest
# 然后推送到阿里云上
$ docker push registry.cn-hangzhou.aliyuncs.com/easy-chat/user-rpc-test:latest
# 在部署的时候拉取下来构建容器运行即可

# 调用makefile
user-rpc-dev:
	@make -f deploy/make/user-rpc.mk release-test

# 拉取新的容器镜像
docker login --username=xmxmx registry.cn-hangzhou.aliyuncs.com
x28

docker stop container_name
docker rm container_name
docker rmi images_name
docker pull images
docker run --name container_name images_name
