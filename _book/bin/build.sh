#!/usr/bin/env bash
set -e


# 编译：校验是否能编译成功
echo 'Build start'
gitbook build 
build_result=$?
if [ $build_result == 0 ]; then
    echo "Build success."
else
    echo "Build failed."
    exit 0
fi

# sudo cp -r _book/index.html bin
git add _book && git commit -m "Initial dist subtree commit"

git subtree push --prefix $_book origin gh-pages