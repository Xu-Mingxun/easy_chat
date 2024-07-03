user-rpc-dev:
	@make -f deploy/mk/user-rpc.mk release-test

release-test: user-rpc-dev

# 启动！ 所有服务
install-server:
	cd ./deploy/script && chmod +x release-test.sh && ./release-test.sh