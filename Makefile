build:
	@templ generate
	@go build -o bin/server.exe cmd/*.go

run: build
	bin/server.exe

css-watch:
	@tailwindcss -i css/input.css -o static/css/output.css --watch
	
database:
	@rm -rf db
	@sqlc generate .