Feature: Upload video
  In order to show a episode to the users
  As a Ruby Evangelist
  I want to upload my screencast

  Scenario: Should not be possible to upload a video when not logged in
    When I upload a video
    Then I should not see the video in the rubycats page
  
  Scenario: Should be possible to upload a video when logged in
    Given I am logged in
    When I upload a video
    Then I should see the video in the rubycats page
  
  Scenario: See the six latest episodes in the root page
    Given I have seven episodes:
	| rvm      | Ruby Version Manager                |
	| macruby  | I'll teach MacRuby                  |
	| capybara | in this episode I'll teach capybara |
	| rspec    | I'll teach RSpec                    |
	| arel     | I'll teach Arel                     |
	| bacon    | I'll teach bacon                    |
	| webrat   | in this episode I'll teach webrat   |
    When I go to the root page
    Then I should not see "in this episode I'll teach webrat"
    And I should not see "webrat"
    And I should see "rvm"
    And I should see "Ruby Version Manager"
    And I should see "macruby"
    And I should see "I'll teach MacRuby"
  
