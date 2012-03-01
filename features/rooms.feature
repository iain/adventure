Feature: Rooms

  Scenario: Current Room

    When I start a game with 2 rooms
    Then I should begin in the first room

  Scenario: Going to another room

    Given there is door between the living room and a dining room
    When I walk to the dining room
    Then I should be in the dining room
