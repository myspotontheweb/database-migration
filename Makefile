
migrate: setup
	kubectl apply  -f migration/migration-configmap.yaml
	kubectl create -f migration/migration-job.yaml

setup:
	kubectl apply  -f base/app-configmap.yaml
	kubectl apply  -f base/app-secret.yaml

clean: clean-jobs
	kubectl delete -f migration/migration-configmap.yaml
	kubectl delete -f base/app-configmap.yaml
	kubectl delete -f base/app-secret.yaml

clean-jobs:
	kubectl get jobs -ogo-template='{{range .items}}{{printf "kubectl delete job %s\n" .metadata.name}}{{end}}' | bash
