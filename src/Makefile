# defines source files and vpaths
include Sources

CXXFLAGS=-D NDEBUG -fexpensive-optimizations -O3

# What source objects are we building?
OBJECTS=$(SOURCES:.cpp=.o)

DIST=../dist/Release
OUTPUT=$(DIST)/libnoise.a

.PHONY: clean cleanobjs cleanlib libnoise

# hooks for future makefiles being able to make multiple SOs, or older SOs
libnoise: $(OUTPUT)

$(DIST):
	mkdir -p $(DIST)

# Real build targets
$(OUTPUT): $(DIST) $(OBJECTS)
	@echo Creaing $@
	@ar -r -s $@ $(OBJECTS)

clean:	cleanobjs cleanlib
cleanobjs:
	@rm -f $(OBJECTS)
	@rm -rf .libs model/.libs module/.libs
cleanlib:
	@rm -f $(OUTPUT)

# C and C++
%.o: %.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

%.o: %.c
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@
