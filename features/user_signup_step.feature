Feature: User Signup
    As a common user
    I would like to see that the website needs to sign up
    So that I can be sure that all users are above quality

  Background: users in database
    Given the following User exist:
      | username | password | role |
      | Lilei|19930618as|Mentor|
      | Hanmeimei|19930618as|Mentor|
      | Hanlei|19930618as|Parent|
      | Limeimei|19930618as|Parent|
    Given I am on the home page of Mentor Matching System
    When I follow "Sign Up"
    Then I should be on the Signup page
    
Scenario: Successful signup and add new mentor
  When I fill in "user[username]" with "wangpanda"
  And I fill in "user[password]" with "19930618as"
  And I fill in "user[password_confirmation]" with "19930618as"
  And I select "Mentor" from "user[role]"
  And I press "Signup"
  Then I should be on the home page of Mentor Matching System
  And I should see "You signed up successfully"
  When I fill in "username" with "wangpanda"
  And I fill in "login_password" with "19930618as"
  And I press "Log In"
  Then I should be on the New Mentor page
  When I fill in "mentor[firstname]" with "Tianjian"
  And I fill in "mentor[lastname]" with "Wang"
  And I fill in "mentor[phone]" with "13633617550"
  And I fill in "mentor[email]" with "wangpanda1993@163.com"
  And I select "Male" from "mentor[gender]"
  And I fill in "mentor[age]" with "20"
  And I fill in "mentor[school]" with "Engineering"
  And I select "Sophomore" from "mentor[grade]"
  And I fill in "mentor[time_slot]" with "Whenever"
  And I fill in "mentor[competitions]" with "Whatever"
  And I fill in "mentor[description]" with "I am beautiful so whatever I said is always correct"
  And I check "mentor[visible]" 
  And I press "Create"
  Then I should see "Tianjian Wang"
  Then I should see "wangpanda1993@163.com"

Scenario: Failure signup(sad path)
  When I fill in "user[username]" with "jiangbingqian"
  And I fill in "user[password]" with "something"
  And I fill in "user[password_confirmation]" with "anything"
  And I select "Mentor" from "user[role]"
  And I press "Signup"
  Then I should be on the New User page
  And I should see "Form is invalid"
  
Scenario: Failed new mentor signup(sad path)
  When I fill in "user[username]" with "wangpanda"
  And I fill in "user[password]" with "19930618as"
  And I fill in "user[password_confirmation]" with "19930618as"
  And I select "Mentor" from "user[role]"
  And I press "Signup"
  Then I should be on the home page of Mentor Matching System
  And I should see "You signed up successfully"
  When I fill in "username" with "wangpanda"
  And I fill in "login_password" with "19930618as"
  And I press "Log In"
  Then I should be on the New Mentor page
  When I fill in "mentor[firstname]" with "Tianjian"
  And I fill in "mentor[lastname]" with "Wang"
  And I fill in "mentor[phone]" with "13633617550"
  And I fill in "mentor[email]" with "wangpanda1993@163.com"
  And I select "Male" from "mentor[gender]"
  And I fill in "mentor[age]" with "101"
  And I fill in "mentor[school]" with "Engineering"
  And I select "Sophomore" from "mentor[grade]"
  And I fill in "mentor[time_slot]" with "Whenever"
  And I fill in "mentor[competitions]" with "Whatever"
  And I fill in "mentor[description]" with "I am beautiful so whatever I said is always correct"
  And I check "mentor[visible]" 
  And I press "Create"
  Then I should be on the New Mentor page
  And I should see "invalid"
  