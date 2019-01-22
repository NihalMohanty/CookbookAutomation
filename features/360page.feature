@player
Feature: Playing a 360 video on SMP Cookbook tool.
  Background:
    Given I am on Cookbook
    And I visit 360 player page

  Scenario: Play program on Onward Journey page using Cookbook
    When I click on Play CTA of 360 page
    Then I see the 360 player starts playing

  @elementsOf360Present
  Scenario: The page should have following elements
    When I click on Play CTA of 360 page
    Then I see the following elements to be present in the page for player
    | pause button          |
    | volume button         |
    | seeker                |

  @playerSwipe
  Scenario: When we play the program and swipe the player it should move
    When I click on Play CTA of 360 page
    Then I see the player move
