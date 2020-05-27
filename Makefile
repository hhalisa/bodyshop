.PHONY: generate-openapi
generate-openapi:
	jsonnet -m docs/openapi -S docs/openapi/main.jsonnet

.PHONY: validate-openapi
validate-openapi: generate-openapi
	openapi validate docs/openapi/openapi.json
