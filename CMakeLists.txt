cmake_minimum_required(VERSION 3.10)
project(hello-nomike)

add_executable(hello-nomike hello-nomike.cpp)

install(TARGETS hello-nomike DESTINATION bin)
