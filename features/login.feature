Feature: User login
  As the administrator of the system
  I would like to get everyone to log in before anything else
  So that I could track them the next time they visit

  Background: Users in database
    Given the following users exist:
      | username | password | role |
      | Lilei|19930618as|Mentor|
      | Hanmeimei|19930618as|Mentor|
      | Hanlei|19930618as|Parent|
      | Limeimei|19930618as|Parent|
    Given I am on the home page of Mentor Matching System

Scenario: mentor login
  When I fill in "username" with "Lilei"
  And I fill in "login_password" with "19930618as"
  And I press "Log In"
  Then I should be on the New Mentor page
  And I should see "Welcome"
  And I follow "Log out"
  
Scenario: parent login
  When I fill in "username" with "Hanlei"
  And I fill in "login_password" with "19930618as"
  And I press "Log In"
  Then I should be on the Parent page
  And I should see "Welcome"
  And I follow "Log out"
  
Scenario: Someone login(Sad path)
  When I fill in "username" with "jiangbingqian"
  And I fill in "login_password" with "19930618as"
  And I press "Log In"
  Then I should be on the home page of Mentor Matching System
  And I should see "Invalid"