cluster :
	kind create cluster --name kind-cilium --config kind-config.yaml
	ansible-playbook cilium_wireguard.yaml
	ansible-playbook metrics-server.yaml

mesh :
	ansible-playbook linkerd-install.yaml

minio :
	ansible-playbook minio.yaml

clean :
	kind delete cluster --name kind-cilium

rancher : 
	ansible-playbook install_rancher.yaml

argocd :
	ansible-playbook install_argo.yaml

rebuild : clean cluster
