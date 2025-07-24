fmt:
	@echo "Formatting rego files ..."
	opa fmt -w $(shell find . -name "*.rego" -type f)
	@echo "Done."

.PHONY: fmt

.PHONY: generate

generate:
ifeq ($(word 2, $(MAKECMDGOALS)),)
	@echo "Error: Policy name required."
	@echo "Usage: make generate <policy-name>"
else
	$(eval name := $(word 2, $(MAKECMDGOALS)))
	$(eval service := $(word 1,$(subst -, ,$(name))))
	$(eval file_base := $(patsubst $(service)-%,%,$(name)))
	$(eval policy_subfolder := $(subst -,_,$(file_base)))

	@echo "Generating policy: $(name)"
	@echo "Service: $(service)"
	@echo "Policy subfolder: $(policy_subfolder)"
	@echo "File name: $(file_base).rego"

	@mkdir -p policies/$(service)/$(policy_subfolder)
	@mkdir -p docs/policies

	# Generate .rego file
	@echo "# Rego policy: $(name)" > policies/$(service)/$(policy_subfolder)/$(file_base).rego
	@echo "package policies.$(service).$(policy_subfolder)" >> policies/$(service)/$(policy_subfolder)/$(file_base).rego
	@echo "import data.utils" >> policies/$(service)/$(policy_subfolder)/$(file_base).rego
	@echo "import rego.v1" >> policies/$(service)/$(policy_subfolder)/$(file_base).rego
	@echo "" >> policies/$(service)/$(policy_subfolder)/$(file_base).rego
	@echo "# TODO: Define rules here" >> policies/$(service)/$(policy_subfolder)/$(file_base).rego

	# Markdown documentation
	@echo "# Policy: $(name)" > docs/policies/$(name).md
	@echo "" >> docs/policies/$(name).md
	@echo "Describe the purpose, rules, and usage of this policy." >> docs/policies/$(name).md

	@echo "Policy written to: policies/$(service)/$(policy_subfolder)/$(file_base).rego"
	@echo "Documentation written to: docs/policies/$(name).md"

	# Append entry to policies.hcl
	@echo "" >> policies.hcl
	@echo "policy \"$(name)\" {" >> policies.hcl
	@echo "  query = \"data.policies.$(service).$(policy_subfolder).deny\"" >> policies.hcl
	@echo "  description = \"TODO: Add description for $(name)\"" >> policies.hcl
	@echo "  enforcement_level = \"advisory\"" >> policies.hcl
	@echo "}" >> policies.hcl

	# Append entry to README.md
	@echo "" >> README.md
	@echo "- TODO: Add policy summary for $(name) ([docs](./docs/policies/$(name).md) | [OPA](./policies/$(service)/$(policy_subfolder)/$(file_base).rego))" >> README.md

	@echo "Done."
endif

# This prevents make from trying to execute the policy name as a target
%:
	@:


lint:
	@echo "Running regal lint on all .rego files under policies/..."
	@regal lint $(shell find policies -type f -name "*.rego") || echo "Linting completed with warnings/errors."

.PHONY: lint
