Feature: Upload video
  In order to show a episode to the users
  As a Ruby Evangelist
  I want to upload my screencast

  Scenario: Should not be possible to upload a video when not logged in
	Given I am not logged in
    When I go to "upload_episode"
    Then I should redirect to rubycats page
  
  Scenario: Should be possible to upload a video when logged in
    Given I am logged in
    When I upload a video
    Then I should see the video in the rubycats page
  
 Scenario: Should return a error message when not pass a video file
   Given I am logged in
   When I upload a video without a file
   Then I should see "You need to pass a file to upload! =p"
 
