@Simulcast
Feature: Playing an Program of Simulcast on SMP Cookbook tool.
  Background:
    Given I am on Cookbook
    And I visit Simulcast page

  Scenario: Play program on simulcast page using Cookbook
    When I click on Play CTA of Simulcast
    Then I see the simulcast player starts playing

  @checkElementsPresent
  Scenario: The page should have the following elements
    When I click on Play CTA of Simulcast
    Then I see the following elements to present in the Simulcast page
    | pause button          |
    | volume button         |
    | fullscreen button     |
    | seeker                |
    | seek bar              |

  @subtitleAppearTest
  Scenario: The player should show subtitle when the subtitile button is on
    When I click on Play CTA of Simulcast
    And I click the subtitle button
    Then I should see the subtitles on the screen

  @subtitleChange
  Scenario: The subtitiles should change the font size when we change the size of subtitle
    When I click on Play CTA of Simulcast
    And I click the subtitle button
    And I choose the minimum size out of size options
    Then I should see the size of subtitle change
