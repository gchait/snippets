SERVING_TAG="knative-v1.23.0"
NET_CONTOUR_TAG="knative-v1.23.0"

SERVING_RELEASES="https://github.com/knative/serving/releases"
NET_CONTOUR_RELEASES="https://github.com/knative/net-contour/releases"

curl -sfL https://get.k3s.io | sh -s - --disable traefik \
  --write-kubeconfig-mode 640 --write-kubeconfig-group "$(id -g)"

USE="export KUBECONFIG=/etc/rancher/k3s/k3s.yaml"
${USE}

kubectl apply -f "${SERVING_RELEASES}/download/${SERVING_TAG}/serving-crds.yaml"
kubectl apply -f "${SERVING_RELEASES}/download/${SERVING_TAG}/serving-core.yaml"

kubectl apply -f "${NET_CONTOUR_RELEASES}/download/${NET_CONTOUR_TAG}/contour.yaml"
kubectl apply -f "${NET_CONTOUR_RELEASES}/download/${NET_CONTOUR_TAG}/net-contour.yaml"

kubectl patch cm -n knative-serving config-network --type merge \
  --patch '{"data":{"ingress-class":"contour.ingress.networking.knative.dev"}}'

set +x
echo
echo "To use this cluster:"
echo "${USE}"
