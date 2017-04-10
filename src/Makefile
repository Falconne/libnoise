# defines source files and vpaths
include Sources

CXX=g++-6

CXXFLAGS=-D NDEBUG -fexpensive-optimizations -O3

# What source objects are we building?
OBJECTS=$(SOURCES:.cpp=.o)

DIST=../dist/Release
OUTPUT=$(DIST)/libnoise.a

.PHONY: all clean cleanobjs cleanlib libnoise

# hooks for future makefiles being able to make multiple SOs, or older SOs
libnoise: $(OUTPUT)

$(DIST):
	mkdir -p $(DIST)

# Real build targets
$(OUTPUT): $(DIST) $(OBJECTS)
	ar -r -s $@ $(OBJECTS)

clean:	cleanobjs cleanlib
cleanobjs:
	-rm $(OBJECTS)
	-rm -rf .libs model/.libs module/.libs
cleanlib:
	-rm $(OUTPUT)

# C and C++
%.o: %.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

%.o: %.c
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@
