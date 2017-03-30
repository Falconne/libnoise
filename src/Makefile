# defines source files and vpaths
include Sources

# What source objects are we building?
OBJECTS=$(SOURCES:.cpp=.o)

.PHONY: all clean cleanobjs cleanlib libnoise

# hooks for future makefiles being able to make multiple SOs, or older SOs
libnoise: libnoise.a

# Real build targets
libnoise.a: $(OBJECTS)
	$(LIBTOOL) --mode=link $(CXX) $(LDFLAGS) -o $@ $(OBJECTS)

clean:	cleanobjs cleanlib
cleanobjs:
	-rm $(OBJECTS)
	-rm -rf .libs model/.libs module/.libs
cleanlib:
	-rm libnoise.a

# C and C++
%.o: %.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o obj/$@

%.o: %.c
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o obj/$@
