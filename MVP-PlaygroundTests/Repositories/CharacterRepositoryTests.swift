//
//  CharacterRepositoryTests.swift
//  MVP-PlaygroundTests
//
//  Created by Ruben van den Engel on 20/02/2020.
//  Copyright © 2020 Bennet. All rights reserved.
//

@testable import MVP_Playground
import XCTest
import PromiseKit

class CharacterRepositoryTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: CharacterDataRepository!
    static var testCharacters: [Character]!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupCharacterRepository()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupCharacterRepository() {
        sut = CharacterDataRepository(remoteAPI: ExternalAPISpy())
        
        CharacterRepositoryTests.testCharacters = [Seeds.Characters.ajak, Seeds.Characters.agentZero, Seeds.Characters.carnage]
    }
    
    // MARK: - Test doubles
    
    class ExternalAPISpy: RemoteAPI {
        
        // MARK: Method call expectations
        
        var fetchRequestCalled = false
        
        // MARK: Spied methods
        
        func request<Type>(_ route: Route) -> Promise<Type> where Type : Decodable {
            self.fetchRequestCalled = true
            return Promise { seal in
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                    seal.fulfill(MarvelResponse(results: CharacterRepositoryTests.testCharacters!) as! Type)
                }
            }
        }
    }
    
    // MARK: - Tests
    
    func testGetCharacters() {
        // Given
        let remoteAPISpy = sut.remoteAPI as! ExternalAPISpy
        
        // When
        var fetchedCharacters = [Character]()
        let expect = expectation(description: "Wait for getCharacters to return")
        sut.getCharacters(offset: 0).done { characters in
            fetchedCharacters = characters
            expect.fulfill()
        }.catch { error in
            XCTFail("Error \(error)")
        }
        
        waitForExpectations(timeout: 1.1)
        
        // Then
        XCTAssert(remoteAPISpy.fetchRequestCalled, "Calling getCharacters() should ask the remote API request()")
        XCTAssertEqual(fetchedCharacters.count, CharacterRepositoryTests.testCharacters.count, "getCharacters() should return a list of characters")
        fetchedCharacters.forEach { character in
            XCTAssert(CharacterRepositoryTests.testCharacters.contains { $0.name == character.name }, "Fetched characters should match the characters in the data store")
        }
    }
}
