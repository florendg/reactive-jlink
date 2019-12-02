
OUTPUT_DIR=target
DEPENDENCY_DIR=$(OUTPUT_DIR)/dependency

DEFAULT: jlink

clean:
	mvn clean

compile: clean
	mvn compile

dependencies:
	mvn dependency:copy-dependencies

generate-module-info: dependencies
	jdeps --generate-module-info target/module-descriptors ${DEPENDENCY_DIR}

patch-jars: generate-module-info
	# Patch reactive streams
	javac -p target/dependency --patch-module org.reactivestreams=target/dependency/reactive-streams-1.0.3.jar target/module-descriptors/org.reactivestreams/module-info.java
	mv target/module-descriptors/org.reactivestreams/module-info.class .
	jar --update --file target/dependency/reactive-streams-1.0.3.jar module-info.class
	javac -p target/dependency --patch-module io.reactivex.rxjava3=target/dependency/rxjava-3.0.0-RC5.jar target/module-descriptors/io.reactivex.rxjava3/module-info.java
	mv target/module-descriptors/io.reactivex.rxjava3/module-info.class .
	jar --update --file target/dependency/rxjava-3.0.0-RC5.jar module-info.class
	rm module-info.class
jlink: clean compile patch-jars
	jlink @jlink.cfg
