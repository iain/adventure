Feature: Items

  Scenario: Looking around

    Given I'm in a room with a rubber chicken
    When I look around
    Then I should see the rubber chicken

  Scenario: Picking up an object

    Given I'm in a room with a rubber chicken
    When I pick up the rubber chicken
    Then I should have the rubber chicken in my inventory
