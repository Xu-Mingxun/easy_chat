# 一个总的启动文件，因为需要启动的服务可能很多，比如rpc、api
need_start_server_shell=(
  # rpc
  user-rpc-test.sh
  # api
)

for i in ${need_start_server_shell[*]} ; do
  chmod +x $i
  ./$i
done

docker ps

# 查看rpc是否将服务都注册到etcd中，便于查错
docker exec -it etcd etcdctl get --prefix ""