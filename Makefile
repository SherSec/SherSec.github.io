BRANCH=$(shell git rev-parse --abbrev-ref HEAD )
git:
	git push origin ${BRANCH}

build:
	jekyll build

serve:
	docker run --rm -it --name jekyll -v ${PWD}:/srv/jekyll  -p 4000:4000 jekyll/jekyll

post:
	rake post title="Hello World"

install:
	bundle install --binstubs

#  When running jekyll locally this will point to github, just remove it, but dont commit it
local:
	perl -pi -e 's|http://SherSec.io||g' _config.yml

gitup:
	git co -b tmp
	git co ${BRANCH}
	git fetch ${REMOTE}
	git reset --hard ${REMOTE}/${BRANCH}
	git diff --name-status tmp
