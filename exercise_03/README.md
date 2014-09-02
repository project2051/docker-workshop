`MUTOWALNE kontenery ` jesli tylko tego chcemy

nsenter --target $(docker inspect --format {{.State.Pid}} $(sudo docker ps -q | head -n1)) --mount --uts --ipc --net --pid
