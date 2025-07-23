fmt:
	@echo "Formatting rego files ..."
	opa fmt -w $(shell find . -name "*.rego" -type f)
	@echo "Done."

.PHONY: fmt

generate-policy:
ifeq ($(strip $(name)),)
	@echo "Error: flag needs an argument: name"
	@echo "Usage: make generate-policy name=your-policy-name"
else
	# Extract parts
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
	@echo "Done."
endif

.PHONY: generate-policy


lint:
	@echo "Running regal lint on all .rego files under policies/..."
	@regal lint $(shell find policies -type f -name "*.rego") || echo "Linting completed with warnings/errors."

.PHONY: lint
