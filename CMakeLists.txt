cmake_minimum_required(VERSION 3.10)
project(hello-nomike)

# Find Catch2
find_package(Catch2 REQUIRED)

# Main executable
add_executable(hello-nomike hello-nomike.cpp hello-nomike-impl.cpp)
install(TARGETS hello-nomike DESTINATION bin)

# Test executable
add_executable(test-nomike test.cpp hello-nomike-impl.cpp)
target_link_libraries(test-nomike PRIVATE Catch2::Catch2WithMain)

# Enable testing
enable_testing()
add_test(NAME greeting_test COMMAND test-nomike)
