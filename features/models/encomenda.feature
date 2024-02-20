Feature: encomenda
  As a user
  I want to be able to manage orders
  So that I can create, edit, view, and delete orders

  Scenario: Creating an order
    Given I am on the order creation page
    When I fill in the form with valid weight, status, delivery date, destinatario ID, and remetente ID
    And I click the "Create Order" button
    Then I should be redirected to the order view page
    And I should see a success message confirming the creation of the order

  Scenario: Editing an order
    Given there is an order saved in the system
    And I am on the edit page of that order
    When I modify the fields of weight, status, delivery date, destinatario ID, or remetente ID
    And I click the "Save Changes" button
    Then I should be redirected to the view page of the updated order
    And I should see a success message confirming the order edition

  Scenario: Viewing an order
    Given there is an order saved in the system
    When I access the view page of that order
    Then I should see all the details of the order, including weight, status, delivery date, destinatario ID, and remetente ID

  Scenario: Deleting an order
    Given there is an order saved in the system
    And I am on the view page of that order
    When I click the "Delete Order" button
    Then I should see a confirmation message asking for the deletion of the order
    When I confirm the deletion of the order
    Then upon confirmation, I should be redirected to the orders list
    And the order should no longer be present in the orders list
