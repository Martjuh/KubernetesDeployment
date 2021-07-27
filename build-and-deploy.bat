docker build --tag cargolytics:local .
if not exist "./tmp" mkdir "./tmp"
if not exist "./tmp/kubernetes" mkdir "./tmp/kubernetes"
xcopy "./kubernetes" "./tmp/kubernetes" /s/y
kustomize edit set image myimage=cargolytics:local
kustomize build "./tmp/kubernetes/dev" -o "./sendit.yaml"
kubectl apply -f "./sendit.yaml"
del /S /Y "./tmp"