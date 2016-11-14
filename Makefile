# REQUIRE_MODULES=-r react -r react-dom -r fela -r react-fela -r redux -r react-redux -r underscore -r markovchain -r redux-logger -r redux-thunk -r axios

# EXCLUDE_MODULES=

watch-js:
	mkdir -p build
	mkdir -p build/client
	watchify -v -e src/client/app.js -t [ babelify --presets [ es2015 react stage-2 ] ] --debug -o build/client/app.js

build-js:
	mkdir -p build
	mkdir -p build/client
	browserify -v -e src/client/app.js -t [ babelify --presets [ es2015 react stage-2 ] ] --debug -o build/client/app.js

build-libs:
	mkdir -p build
	mkdir -p build/client
	browserify -o build/client/libs.js

build-src:
	mkdir -p src
	mkdir -p src/client
	mkdir -p src/client/css
	touch -p src/client/css/main.css
	mkdir -p src/server
	touch -p src/server/index.html
	mkdir -p assets

build-assets:
	mkdir -p build
	mkdir -p build/client
	mkdir -p build/server
	cp -r assets/ build/client/
	cp src/server/index.html build/server/
	cp src/client/css/main.css build/client/

clean:
	rm -rf build/
