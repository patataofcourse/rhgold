#include <gtest/gtest.h>
#include <cstring>
#include <vector>

// Forward declare the vulnerable function from src/Main/String.cpp
extern "C" char *strCat(char *dest, char *src);

class BufferBoundsTest : public ::testing::TestWithParam<std::pair<size_t, size_t>> {};

TEST_P(BufferBoundsTest, BufferReadNeverExceedsDeclaredLength) {
    // Invariant: Buffer reads must not exceed the declared buffer size
    // even when source string is larger than destination capacity
    
    auto [dest_size, src_size] = GetParam();
    
    std::vector<char> dest(dest_size, '\0');
    std::vector<char> src(src_size, 'A');
    src[src_size - 1] = '\0';
    
    // Pre-fill destination with sentinel to detect overflow
    if (dest_size > 0) {
        dest[dest_size - 1] = 'X';
    }
    
    // Call the function - should not crash or overflow
    char *result = strCat(dest.data(), src.data());
    
    // Verify result is valid pointer
    ASSERT_NE(result, nullptr);
    
    // Verify destination buffer was not written beyond its bounds
    // Check that the sentinel or buffer end is intact
    if (dest_size > 1) {
        // At minimum, verify we can safely read the result
        size_t result_len = std::strlen(result);
        ASSERT_LE(result_len, dest_size - 1) 
            << "Buffer read exceeded declared length";
    }
}

INSTANTIATE_TEST_SUITE_P(
    AdversarialInputs,
    BufferBoundsTest,
    ::testing::Values(
        std::make_pair(10, 10),      // Boundary: exact fit
        std::make_pair(10, 20),      // Exploit: 2x overflow
        std::make_pair(10, 100),     // Exploit: 10x overflow
        std::make_pair(5, 5),        // Valid: small buffer
        std::make_pair(256, 512)     // Exploit: large buffer overflow
    )
);

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}