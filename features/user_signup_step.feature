Feature: User Signup
    As a common user
    I would like to see that the website needs to sign up
    So that I can be sure that all users are above quality

  Background: Users in database
    Given the following users exist:
      | username | password | role |
      | Lilei|19930618as|Mentor|
      | Hanmeimei|19930618as|Mentor|
      | Hanlei|19930618as|Parent|
      | Limeimei|19930618as|Parent|
    Given I am on the home page of Mentor Matching System
    When I follow "Sign Up"
    
Scenario: Successful signup
  When I fill in "username" with "wangpanda"
  And I fill in "password" with "19930618as"
  And I fill in "password Confirmation" with "19930618as"
  And I select "Parent" from "role"
  And I press "Signup"
  Then I should be on the home page of Mentor Matching System
  And I should see "You signed up successfully"
  