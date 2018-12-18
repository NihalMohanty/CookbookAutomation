@livePlayer
Feature: Playing a Random video on SMP Cookbook tool.
  Background:
    Given I am on Cookbook
    And I visit a Random player page

  Scenario: Play program on Cookbook
    When I click on Play CTA of a Random page
    Then I see the program starts playing

  @guidance
  Scenario: The guidance message should appear beside the play button in the start
    Then I see the guidance message in the start

  
