Feature: Looking

  Scenario: Finding things in the room

    Given I'm in a room with a rubber chicken
    When I look around
    Then I should see the rubber chicken

  Scenario: Seeing ways out of the room

    Given I'm in a room with a way north
    When I look around
    Then I should see the way out


