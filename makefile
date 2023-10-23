run: 
	@echo "Running..."
	@flutter run --debug
	@echo "Done"

clean:
	@echo "Cleaning..."
	@flutter clean
	@echo "Done"

build-release:
	@echo "Clear old build release"
	@rm -rf build
	@echo "Building..."
	@flutter build apk --release
	@echo "Done"

gen:
	@echo "Generating..."
	@flutter pub run build_runner build --delete-conflicting-outputs
	@echo "Done"

test:
	@echo "Testing..."
	@flutter test
	@echo "Done"

get: 
	@echo "Getting..."
	@flutter pub get
	@echo "Done"
