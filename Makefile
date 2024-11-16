# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -g -I/usr/include/boost  # Add Boost include path if needed
LDFLAGS = -lboost_system -lboost_date_time -lsqlite3  # Removed -lboost_heap

# Targets
TARGETS = program1 program2
OBJS = program1.o program2.o

# Default target
all: $(TARGETS)

# Rules for building program1
program1: program1.o
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

program1.o: program1.cpp
	$(CXX) $(CXXFLAGS) -c $<

# Rules for building program2
program2: program2.o
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

program2.o: program2.cpp
	$(CXX) $(CXXFLAGS) -c $<

# Debug target
debug: $(OBJS)
	$(CXX) $(CXXFLAGS) -o program1 program1.o $(LDFLAGS)
	$(CXX) $(CXXFLAGS) -o program2 program2.o $(LDFLAGS)

# Run targets
run_program1: program1
	./program1

run_program2: program2
	./program2

# Clean target
clean:
	rm -f $(OBJS) $(TARGETS)
