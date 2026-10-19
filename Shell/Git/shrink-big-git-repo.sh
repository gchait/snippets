sudo wget -qO /opt/bfg.jar https://repo1.maven.org/maven2/com/madgag/bfg/1.15.0/bfg-1.15.0.jar
git clone --mirror "${REPO_URL}" repo.git
cd repo.git || exit
java -jar /opt/bfg.jar -b 2M

git reflog expire --expire=now --all
git gc --prune=now --aggressive

git push
