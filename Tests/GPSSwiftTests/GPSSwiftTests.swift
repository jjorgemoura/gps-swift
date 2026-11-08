import Testing

@testable import GPSSwift

@Suite("GPSSwift")
struct GPSSwiftTests {
    @Test
    func greeting() {
        #expect(GPSSwift().greeting() == "Hello from GPSSwift")
    }
}
