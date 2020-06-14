import Foundation

class MenuInputMapperTests: TestCase {
    typealias Element = MenuOption
    
    internal var sut: MenuInputMapper!
    
    private func setUpSut() {
        sut = MenuInputMapper()
    }
    
    private func tearDownSut() {
        sut = nil
    }
}

extension MenuInputMapperTests {
    internal func testMenuInputMapperMapsOneIntoPrimaryExampleOption() {
        // Arrange
        setUpSut()
        
        // Act
        let result = sut.mapInputToMenuOption(input: "1")
        
        // Assert
        assertEqual(result, .primaryExample, testName: "testMenuInputMapperMapsOneIntoPrimaryExampleOption")
    }
    
    internal func testMenuInputMapperMapsTwoIntoAdvancedExampleOption() {
        // Arrange
        setUpSut()
        
        // Act
        let result = sut.mapInputToMenuOption(input: "2")
        
        // Assert
        assertEqual(result, .advancedExample, testName: "testMenuInputMapperMapsTwoIntoAdvancedExampleOption")
    }
    
    internal func testMenuInputMapperMapsThreeIntoTestsOption() {
        // Arrange
        setUpSut()
        
        // Act
        let result = sut.mapInputToMenuOption(input: "3")
        
        // Assert
        assertEqual(result, .tests, testName: "testMenuInputMapperMapsThreeIntoTestsOption")
    }
    
    internal func testMenuInputMapperMapsFourIntoExitOption() {
        // Arrange
        setUpSut()
        
        // Act
        let result = sut.mapInputToMenuOption(input: "4")
        
        // Assert
        assertEqual(result, .exit, testName: "testMenuInputMapperMapsFourIntoExitOption")
    }
}
