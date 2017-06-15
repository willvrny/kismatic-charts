.PHONY: dist
dist: package index

.PHONY: package
package: helm-docker-build
	docker run -v $(shell pwd)/charts:/charts -v $(shell pwd)/docs:/docs -v $(shell pwd)/hack:/hack helm sh /hack/package.sh /charts /docs

.PHONY: index
index: helm-docker-build
	docker run -v $(shell pwd)/docs:/docs helm helm repo index /docs --url https://apprenda.github.io/kismatic-charts/
	
.PHONY: helm-docker-build
helm-docker-build:
	docker build . -t helm

