@Simulcast
Feature: Playing an Audio with the new AudioUI on SMP Cookbook tool.

  Scenario: Play audio on simulcast page using Cookbook
    And I visit Simulcast page
    When I click on Play CTA of Simulcast
    Then I see the simulcast player starts playing
