
DEFAULT: jlink

clean:
	mvn clean

compile: clean
	mvn compile

dependencies:
	mvn dependency:copy-dependencies

generate-module-info: dependencies
	jdeps --generate-module-info target/module-descriptors target/dependency

patch-jars: generate-module-info
	javac -p target/dependency --patch-module org.reactivestreams=target/dependency/reactive-streams-1.0.2.jar target/module-descriptors/org.reactivestreams/module-info.java
	mv target/module-descriptors/org.reactivestreams/module-info.class .
	jar --update --file target/dependency/reactive-streams-1.0.2.jar module-info.class
	javac -p target/dependency --patch-module io.reactivex.rxjava2=target/dependency/rxjava-2.2.12.jar target/module-descriptors/io.reactivex.rxjava2/module-info.java
	mv target/module-descriptors/io.reactivex.rxjava2/module-info.class .
	jar --update --file target/dependency/rxjava-2.2.12.jar module-info.class
	rm module-info.class
jlink: clean compile patch-jars
	jlink @jlink.cfg
