EKHOTRACEDIR := ekho/traces/
SCRIPTFILE := scripts/mayfly.sc

JAVAC=javac -g
JAVA=java
JAR=jar

EMPTY :=
SPACE := ${EMPTY} ${EMPTY}
LIBS := ${wildcard lib/*.jar}
BUILD := build
CLASSPATH=${subst ${SPACE},:,$(BUILD)/ ${LIBS}}
JAVACARGS=-deprecation -Xlint:unchecked -source 1.7 -target 1.7 -classpath ".:${CLASSPATH}" -d $(BUILD)

JARFILE := mspsim.jar
JAVAARGS=-classpath "${CLASSPATH}"

# source directories
SRC_DIR := se edu 
PACKAGES := $(shell find $(SRC_DIR) -type d)
SOURCES := ${wildcard *.java $(addsuffix /*.java,$(PACKAGES))}
#SOURCES := $(subst ./,,$(shell find $(SRC_DIR) -type f -iname '*.java'))
CLASSES := ${addprefix $(BUILD)/,$(SOURCES:.java=.class)}

.PHONY:	compile clean jar jarclean run runekho cleanclass

compile: $(BUILD)	$(CLASSES) 

$(BUILD):
	@mkdir $@	

$(BUILD)/%.class:	%.java
	$(JAVAC) $(JAVACARGS) $<

jar:	$(JARFILE)

$(JARFILE):	$(OBJECTS)
	- rm -rf JarManifest.txt
	@echo >>JarManifest.txt "Manifest-Version: 1.0"
	@echo >>JarManifest.txt "Sealed: true"
	@echo >>JarManifest.txt "Main-Class: se.sics.mspsim.Main"
	@echo >>JarManifest.txt "Class-path: ${LIBS}"
	$(JAR) cfm $(JARFILE) JarManifest.txt -C $(BUILD) .
	- rm -rf JarManifest.txt	

clean:
	rm -rf $(BUILD)

cleanclass:	
	rm -f $(addsuffix /*.class,$(PACKAGES))

jarclean:
	rm -rf $(JARFILE)

run:
	$(JAVA) $(JAVAARGS) edu.clemson.platform.MayflyNode $(FIRMWAREFILE) $(ARGS) -nogui -exitwhendone -autorun=$(SCRIPTFILE) 

runekho:
	$(JAVA) $(JAVAARGS) edu.clemson.platform.MayflyNode $(FIRMWAREFILE) $(ARGS) -nogui -exitwhendone -ekhotracedir=$(EKHOTRACEDIR) -autorun=$(SCRIPTFILE)