sudo wget -qO /opt/bfg.jar https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar
java -jar /opt/bfg.jar -b 1M

git reflog expire --expire=now --all
git gc --prune=now --aggressive

git push origin --force
