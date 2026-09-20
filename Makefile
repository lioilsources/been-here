.PHONY: help get gen l10n analyze format test check clean run-ios run-android

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  %-14s %s\n", $$1, $$2}'

get: ## Resolve dependencies
	flutter pub get

gen: get l10n ## Run all code generation (drift + localizations)
	dart run build_runner build

l10n: ## Regenerate localizations from the .arb files
	flutter gen-l10n

analyze: ## Static analysis; any finding fails the build
	flutter analyze --fatal-infos --fatal-warnings

format: ## Format every Dart file
	dart format lib test

test: ## Run the test suite
	flutter test

integration: ## On-device test against the real photo library: make integration DEVICE=<id>
	@test -n "$(DEVICE)" || (echo "DEVICE=<device id> required; see flutter devices" && exit 1)
	flutter test integration_test -d $(DEVICE)

check: analyze test ## What CI runs (integration needs a device, so not here)

clean:
	flutter clean

run-ios:
	flutter run -d iPhone

run-android:
	flutter run -d android
