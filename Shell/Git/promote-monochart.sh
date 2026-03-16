# shellcheck disable=SC2016,SC2154,SC2155,SC2164

# If full merge
cd "${manifest_dir}"
git checkout "${dest_branch}"
git merge -s ours --no-commit "${src_branch}"
git read-tree -u --reset "${src_branch}"
git commit -m "Merge ${src_branch} into ${dest_branch}" || true
git push origin "${dest_branch}"
git checkout - || true

# If single service
cd "${manifest_dir}"
export new_tag=$(yq '.${specific_app}.bbbbb' xxxx/yyyy.yaml)
git checkout "${dest_branch}"
yq '. | .${specific_app}.bbbbb = env(new_tag)' xxxx/yyyy.yaml > yyyy.yaml.tmp &&
  mv yyyy.yaml.tmp xxxx/yyyy.yaml
git add xxxx/yyyy.yaml
git checkout "${src_branch}" -- "zxxxx/${specific_app}.yaml"
git commit -m "Promote ${specific_app} from ${src_branch} to ${dest_branch}" || true
git push origin "${dest_branch}"
git checkout - || true
