# shellcheck disable=SC2154,SC2016

# If full merge
# shellcheck disable=SC2164
cd "${manifest_dir}"
git checkout "${dest_branch}"
git merge "${src_branch}" --no-commit --strategy-option theirs
rm -f .git/MERGE_HEAD

# If single service
cd "${manifest_dir}"
# shellcheck disable=SC2155
export new_tag=$(yq '.${specific_app}.bbbbb' xxxx/yyyy.yaml)
git checkout "${dest_branch}"
yq '. | .${specific_app}.bbbbb = env(new_tag)' xxxx/yyyy.yaml > yyyy.yaml.tmp &&
  mv yyyy.yaml.tmp xxxx/yyyy.yaml
git checkout "${src_branch}" -- "zxxxx/${specific_app}.yaml"

### PUSH LOGIC GOES HERE ###
