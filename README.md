# easy_chat
im微服务项目

## 目录结构
- apps 应用目录，记录相关的服务信息
  - user
    - api
    - rpc
      - etc
        - dev
        - prod
        - local
      - user.proto  // rpc服务构建文件
  - im
- bin 编译后的程序存储目录
  - exec.sh // 记录项目中可能使用的命令
- deploy 项目部署相关的信息，如部署的时候一些程序的配置，sql或者dockerfile
  - dockerfile 项目部署所使用的dockerfile
  - make 存放makefile，自动编译和执行项目
    - user-rpc.mk // 编译二进制文件
  - script 项目中使用的脚本
    - user-rpc-test.mk // 删除镜像的脚本
- pkg 项目的公共工具目录
- docker-compose.yaml
- Makefile 项目编译脚本程序