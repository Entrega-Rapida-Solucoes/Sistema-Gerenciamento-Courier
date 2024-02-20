Feature: endereco
  As a user
  I want to be able to manage addresses
  So that I can create, edit, view, and delete addresses

  Scenario: Creating an address
    Given I am on the address creation page
    When I fill in the form with valid CEP, street, number, complement, city, neighborhood, country, and postal code
    And I click the "Create Address" button
    Then I should be redirected to the address view page
    And I should see a success message confirming the creation of the address

  Scenario: Editing an address
    Given there is an address saved in the system
    And I am on the edit page of that address
    When I modify the fields of CEP, street, number, complement, city, neighborhood, country, or postal code
    And I click the "Save Changes" button
    Then I should be redirected to the view page of the updated address
    And I should see a success message confirming the address edition

  Scenario: Viewing an address
    Given there is an address saved in the system
    When I access the view page of that address
    Then I should see all the details of the address, including CEP, street, number, complement, city, neighborhood, country, and postal code

  Scenario: Deleting an address
    Given there is an address saved in the system
    And I am on the view page of that address
    When I click the "Delete Address" button
    Then I should see a confirmation message asking for the deletion of the address
    When I confirm the deletion of the address
    Then upon confirmation, I should be redirected to the addresses list
    And the address should no longer be present in the addresses list
