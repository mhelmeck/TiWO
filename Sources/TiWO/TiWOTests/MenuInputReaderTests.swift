import Foundation

class MenuInputReaderTests: TestCase {
    typealias Element = Int
    
    internal var sut: MenuInputReader!
    
    private func setUpSut() {
        sut = MenuInputReader()
    }
    
    private func tearDownSut() {
        sut = nil
    }
}

extension MenuInputReaderTests {
    internal func testMenuInputReaderValidateOnlyFirstFourNumbers() {
        // Arrange
        setUpSut()
        
        // Act & Assert
        assertTrue(sut.isInputValid("1"), testName: "testMenuInputReaderValidateOnlyFirstFourNumbers - test with 1")
        assertTrue(sut.isInputValid("2"), testName: "testMenuInputReaderValidateOnlyFirstFourNumbers - test with 2")
        assertTrue(sut.isInputValid("3"), testName: "testMenuInputReaderValidateOnlyFirstFourNumbers - test with 3")
        assertTrue(sut.isInputValid("4"), testName: "testMenuInputReaderValidateOnlyFirstFourNumbers - test with 4")
    }
    
    internal func testMenuInputReaderDoesNotValidateOtherInputs() {
        // Arrange
        setUpSut()
        
        // Act & Assert
        assertFalse(sut.isInputValid("5"), testName: "testMenuInputReaderDoesNotValidateOtherInputs - test with 5")
        assertFalse(sut.isInputValid("aaa"), testName: "testMenuInputReaderDoesNotValidateOtherInputs - test with aaa")
    }
}
