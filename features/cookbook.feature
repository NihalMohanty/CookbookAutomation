Feature: Playing an Audio with the new AudioUI on SMP Cookbook tool.
  Background:
    Given I am on Cookbook
    
  Scenario: Play audio on Radio page using Cookbook
    And I visit Radio page
    When I click on Play CTA
    Then I see the audio starts playing
