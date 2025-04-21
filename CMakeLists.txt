cmake_minimum_required(VERSION 3.10)
project(hello-nomike)

# Main executable
add_executable(hello-nomike hello-nomike.cpp hello-nomike-impl.cpp)
install(TARGETS hello-nomike DESTINATION bin)

# Testing configuration
option(BUILD_TESTING "Build the testing tree" ON)
if(BUILD_TESTING)
    # Use find_package only if not in Guix build (where it's in inputs)
    if(NOT DEFINED ENV{GUIX_BUILD})
        find_package(Catch2 REQUIRED)
    endif()

    add_executable(test-nomike test.cpp hello-nomike-impl.cpp)
    
    if(TARGET Catch2::Catch2WithMain)
        target_link_libraries(test-nomike PRIVATE Catch2::Catch2WithMain)
    else()
        # Fallback for Guix environment
        find_library(CATCH2_LIBRARY NAMES catch2)
        find_path(CATCH2_INCLUDE_DIR NAMES catch2/catch.hpp)
        target_include_directories(test-nomike PRIVATE ${CATCH2_INCLUDE_DIR})
        target_link_libraries(test-nomike PRIVATE ${CATCH2_LIBRARY})
    endif()

    enable_testing()
    add_test(NAME greeting_test COMMAND test-nomike)
endif()
