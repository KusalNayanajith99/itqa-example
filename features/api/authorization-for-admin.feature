@api
Feature: Book API Authorization for Admin Role

  Background: 
    Given the book database is empty
    And I am authenticated with username "admin" and password "password"

  Scenario:Admin can successfully get all books
    When I send a "GET" request to "/api/books"
    Then the response status code should be 200

  Scenario: Admin can successfully create a new book
    When I have created a book with following details:
      | title       | author      |
      | Admin Book  | Admin Author |
    Then the response status code should be 201

  Scenario: Admin can view specific book details
    Given I have created a book with following details:
      | title       | author      |
      | Admin Book  | Admin Author |
    When I send a "GET" request to "/api/books/{stored-id}"
    Then the response status code should be 200

  Scenario: Admin can update existing book
    Given I have created a book with following details:
      | title       | author      |
      | Admin Book  | Admin Author |
    When I update the book with:
      """
      {
        "id": "{stored-id}",
        "title": "Updated Admin Book",
        "author": "Updated Admin Author"
      }
      """
    Then the response status code should be 200

  @known-bug @bug-1
  Scenario: Admin can delete a book
    Given I have created a book with following details:
      | title       | author      |
      | Admin Book  | Admin Author |  
    When I send a "DELETE" request to "/api/books/{stored-id}"
    Then the response status code should be 200