eks_version=$(xxxxx)
region="yyyyy"
cluster_name="zzzzz"

for addon in vpc-cni coredns kube-proxy aws-ebs-csi-driver; do
  addon_version=$(aws eks describe-addon-versions --region "${region}" --addon-name "${addon}" \
    --kubernetes-version "${eks_version}" --query 'addons[].addonVersions[].addonVersion' --output text |
    tr '\t' '\n' | sort -V | tail -n 1)

  aws eks update-addon --region "${region}" --cluster-name "${cluster_name}" \
    --addon-name "${addon}" --addon-version "${addon_version}" --resolve-conflicts XXX

  aws eks wait addon-active --region "${region}" --cluster-name "${cluster_name}" --addon-name "${addon}"
done
