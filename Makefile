build:
	@templ generate
	@go build -o bin/server.exe cmd/*.go

run: build
	bin/server.exe

watch-tailwind:
	@tailwindcss -i view/css/input.css -o view/css/output.css --watch