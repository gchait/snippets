ls | xargs -i git -C {} remote get-url origin 2> /dev/null | xargs -i bash -c '(cd ~/Projects && git clone {})'
