#define CATCH_CONFIG_MAIN
#include <catch2/catch.hpp>
#include "hello-nomike.h"

TEST_CASE("Greeting is correct", "[greeting]") {
    REQUIRE(get_greeting() == "Hello nomike!");
}
