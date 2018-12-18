@player
Feature: Playing a 360 video on SMP Cookbook tool.
  Background:
    Given I am on Cookbook
    And I visit 360 player page

    Scenario: Play program on Onward Journey page using Cookbook
      When I click on Play CTA of 360 page
      Then I see the 360 player starts playing
