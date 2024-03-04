build:
	@templ generate
	@go build -o bin/server.exe cmd/*.go

run: build
	bin/server.exe

css-watch:
	@tailwindcss -i css/input.css -o css/output.css --watch