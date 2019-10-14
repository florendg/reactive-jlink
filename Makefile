
DEFAULT: jlink

clean:
	mvn clean

compile: clean
	mvn compile

dependencies:
	mvn dependency:copy-dependencies

jlink: compile dependencies
	jlink @jlink.cfg
