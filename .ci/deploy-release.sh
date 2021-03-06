#! /usr/bin/env bash

set -ex;

readonly target='resume-dist.tar.gz'
readonly ghr='ghr_v0.12.2_linux_amd64'

rm dist/main.css
wget https://github.com/tcnksm/ghr/releases/download/v0.12.2/$ghr.tar.gz
tar -xvzf $ghr.tar.gz
tar -cvzf $target ./dist
./$ghr/ghr -t ${GITHUB_RELEASE_TOKEN} \
    -u ${GITHUB_USERNAME} \
    -r ${GITHUB_REPONAME} \
    -replace \
    resume $target
