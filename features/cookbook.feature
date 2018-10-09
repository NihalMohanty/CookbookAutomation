Feature: Playing audio using Cookbook!
  Scenario: Play audio on Radio page using Cookbook
    Given I am on Cookbook
    And I visit Radio page
    When I click on Play CTA
    Then I see the audio starts playing
