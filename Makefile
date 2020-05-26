.PHONY: generate-openapi
generate-openapi:
	jsonnet -m docs/openapi -S docs/openapi/main.jsonnet
