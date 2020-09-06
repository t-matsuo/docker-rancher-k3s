# docker-rancher-k3s
Dockerfile for making custom k3s docker image to hook before executing k3s.
Please mount volume at /hook dir, and put sh(not bash) scripts. (script name must be xxx.sh)
It's useful when using k3d.

ex (docker run)

    docker run -d --name k3s-server --privileged -e K3S_TOKEN="mytokenaabbccdd" -e K3S_KUBECONFIG_OUTPUT=/output/kubeconfig.yaml -e k3S_KUBECONFIG_MODE=666 -v `pwd`/hook:/hook -it tmatsuo/k3s:v1.18.6-k3s1 server --tls-san 0.0.0.0


ex (k3d v3)

    k3d cluster create --image tmatsuo/k3s:v1.18.6-k3s1 -v `pwd`/hook:/hook
