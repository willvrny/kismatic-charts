dist:
	hack/tar.sh $(shell pwd)/charts $(shell pwd)/docs
	cd docs && helm repo index .