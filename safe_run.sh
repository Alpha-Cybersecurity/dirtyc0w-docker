docker build -t dcow .
docker run --security-opt apparmor:docker-default -it dcow bash
