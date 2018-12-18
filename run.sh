docker build -t dcow .
docker run --privileged --security-opt seccomp=unconfined --security-opt apparmor=unconfined -it dcow bash
