@radio
Feature: Playing an Audio with the new AudioUI on SMP Cookbook tool.
  Background:
    Given I am on Cookbook
    And I visit Radio page

  Scenario: Play audio on Radio page using Cookbook
    When I click on Play CTA
    Then I see the audio starts playing

  Scenario: The page should have following elements
    When I click on Play CTA
    Then I see the following elements to be present in the page
    | Pause Icon    |
    | Volume button |
    | -20 button    |
    | +20 button    |
    | Seek Bar      |
    | Seeker        |


  Scenario: In the start of the player the -20 button should be disabled
    When I am at the start of the player
    Then the -20 button is disabled

  Scenario: In the end of the player the +20 button should be disabled
    When I am at the end of the player
    Then the +20 button is disabled

  Scenario: The forward 20 option should seek the bar to 20 seconds ahead
    When I pause the audio
    And I click the forward 20 button
    Then I see the time moved 20 seconds ahead or to the end of the player

  Scenario: The backward 20 option should seek the bar to 20 seconds backward
    When I pause the audio
    And I click the backward 20 button
    Then I see the time moved 20 seconds behind or to the start

  Scenario: The +20 number should appear above the forward 20 button as we click it.
    When I click on Play CTA
    And I click the forward 20 button
    Then I see the +20 number above the button

  Scenario: The -20 number should appear above the backward 20 button as we click it.
    When I click on Play CTA
    And I click the backward 20 button
    Then I see the -20 number above the button
