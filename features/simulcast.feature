@Simulcast
Feature: Playing an Audio with the new AudioUI on SMP Cookbook tool.
  Background:
    Given I am on Cookbook
    And I visit Simulcast page

  Scenario: Play audio on simulcast page using Cookbook
    When I click on Play CTA of Simulcast
    Then I see the simulcast player starts playing
