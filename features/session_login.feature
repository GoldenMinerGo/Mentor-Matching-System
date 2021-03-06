Feature: Session login
  As the a user
  I would like the database to remember my login status
  So that I would not be filling login every time

  Background: users in database
    Given the following User exist:
      | username | password | role |
      | Lilei|19930618as|Mentor|
      | Hanmeimei|19930618as|Mentor|
      | Hanlei|19930618as|Parent|
      | Limeimei|19930618as|Parent|
    Given I am on the home page of Mentor Matching System
    When I fill in "username" with "Lilei"
    And I fill in "login_password" with "19930618as"
    And I press "Log In"
    Then I should be on the New Mentor page
    And I should see "Welcome"
  
Scenario: Session login
  Given I am on the home page of Mentor Matching System
  Then I should be on the New Mentor page
  