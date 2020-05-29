.PHONY: generate-openapi
generate-openapi:
	jsonnet -m docs/openapi -S docs/openapi/main.jsonnet

.PHONY: validate-openapi
validate-openapi: generate-openapi
	openapi validate --config docs/openapi/.redocly.json docs/openapi/openapi.json
