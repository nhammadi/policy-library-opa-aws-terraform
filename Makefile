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
	# Extract service and format subfolder
	$(eval service := $(word 1,$(subst -, ,$(name))))
	$(eval policy_subfolder := $(subst -,_,$(name)))

	@echo "Generating policy: $(name)"
	@echo "Service: $(service)"
	@echo "Policy subfolder: $(policy_subfolder)"

	@mkdir -p policies/$(service)/$(policy_subfolder)
# 	@mkdir -p policies/test/$(policy_subfolder)
	@mkdir -p docs/policies

	@echo "# Rego policy: $(name)" > policies/$(service)/$(policy_subfolder)/$(name).rego
	@echo "package policies.$(service).$(policy_subfolder)" >> policies/$(service)/$(policy_subfolder)/$(name).rego
	@echo "import data.utils >> policies/$(service)/$(policy_subfolder)/$(name).rego
	@echo "import rego.v1" >> policies/$(service)/$(policy_subfolder)/$(name).rego
	@echo "" >> policies/$(service)/$(policy_subfolder)/$(name).rego
	@echo "# TODO: Define rules here" >> policies/$(service)/$(policy_subfolder)/$(name).rego

# 	@echo "// Tests for policy: $(name)" > policies/test/$(policy_subfolder)/$(name)_test.rego
# 	@echo "package policies.test.$(service).$(policy_subfolder)" >> policies/test/$(policy_subfolder)/$(name)_test.rego
# 	@echo "" >> policies/test/$(policy_subfolder)/$(name)_test.rego
# 	@echo "# TODO: Write test cases" >> policies/test/$(policy_subfolder)/$(name)_test.rego

	# Create markdown doc
	@echo "# Policy: $(name)" > docs/policies/$(name).md
	@echo "" >> docs/policies/$(name).md
	@echo "Describe the purpose, rules, and usage of this policy." >> docs/policies/$(name).md

	@echo "Policy written to: policies/$(service)/$(policy_subfolder)/$(name).rego"
# 	@echo "Test file written to: policies/test/$(policy_subfolder)/$(name)_test.rego"
	@echo "Documentation written to: docs/policies/$(name).md"
	@echo "Done."
endif

.PHONY: generate-policy


lint:
	@echo "Running regal lint on all .rego files under policies/..."
	@regal lint $(shell find policies -type f -name "*.rego") || echo "Linting completed with warnings/errors."

.PHONY: lint
