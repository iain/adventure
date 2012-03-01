Feature: Items

  Scenario: Picking up an object

    Given I'm in a room with a rubber chicken
    When I pick up the rubber chicken
    Then I should have the rubber chicken in my inventory
