@continuousPlay
Feature: Playing an Program of Simulcast on SMP Cookbook tool.
  Background:
    Given I am on Cookbook
    And I visit Onward Journey page

  Scenario: Play program on Onward Journey page using Cookbook
    When I click on Play CTA of Onwardjourney page
    Then I see the player starts playing

  @findCP
  Scenario: The Continuous Play box should appear when the autoplay is on
    When I click on Play CTA of Onwardjourney page
    And I open the autoplay option
    Then I see the Continuous Play box at the end of the program

  @checkCP
  Scenario: The Continuous Play should come up after the video ends while in Autoplay on
    When I click on Play CTA of Onwardjourney page
    And I open the autoplay option
    Then I see the Countdown appears after the CP plugin appears

  @noCP
  Scenario: The Continuous Play should not appear when autoplay is off
    When I click on Play CTA of Onwardjourney page
    And I open the autoplay option
    And I switch off the autoplay option
    Then I dont find any CP at the end of the video

  @elementsPresentCP
  Scenario: The page should have following elements
    When I click on Play CTA of Onwardjourney page
    Then I see the following elements to be present in the page for CP
    | pause button          |
    | volume button         |
    | settings_button       |
    | leftTimeSlot          |
    | rightTimeSlot         |
    | seeker                |
    | cp box                |
    | countdown             |

  @autoPlayWorks
  Scenario: After the program ends, the next program should get played automatically when auto play is on.
    When I click on Play CTA of Onwardjourney page
    And I open the autoplay option
    And I seek to the end of the player
    Then After specified time the next program gets played

  @playingProgramFromCp
  Scenario: After CP loads we should be able to play any option from the list of suggested programs in list
    When I click on Play CTA of Onwardjourney page
    And I open the autoplay option
    And I seek to the end of the player
    Then I am able to click and play one of the programs from the List

  @upNextIn
  Scenario: When CP loads we should be able to see "Up next in..." section which loads the upcoming program
    When I click on Play CTA of Onwardjourney page
    And I open the autoplay option
    And I seek to the end of the player
    Then I see 'Up next in' section

  @twoSectionsInCP
  Scenario: When CP loads we should be able to see two sections i.e: Up next and More when countdown is off
    When I click on Play CTA of Onwardjourney page
    And I open the autoplay option
    And I seek to the end of the player
    Then I see one Up next and one More section

  @cpInFullScreen
  Scenario: Cp should be present when the screen in is full screen
    When I click on Play CTA of Onwardjourney page
    And I open the autoplay option
    And I go to full screen mode
    And I seek to the end of the player
    Then I see the Continuous Play box at the end of the program
