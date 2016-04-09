Feature: children operations
  As a parent
  So that I can manage my children's profile
  I want to check all my children's groups and mentors information 
  
  Background: users, parents, children, groups, invitations, mentors in database
  Given the following User exist:
    | username    | password | role     | last_login_time |
    | user1       | 1q2w3e   | parent   | 1977-05-25      |
    | user2       | 1q2w3e   | parent   | 1982-06-25      |
    | user3       | 1q2w3e   | mentor   | 1979-05-25      |

  Given the following Parent exist:
    |user_id | firstname | lastname | phone      | email          |
    |1       | Lei       | Li       | 9796760001 | user1@tamu.edu |
    |4       | Ming      | Xiao     | 9796760004 | user4@tamu.edu |
    |5       | Liangchen | Ye       | 9796760006 | user6@tamu.edu |
    
  Given the following Child exist:
    |parent_id| firstname| lastname| gender| age| school  | grade| time_slot         | str_com      | description | visible | group_id |
    |1        | Alei     | Lei     | male  | 5  | school 1| G1   | 12:00 - 13:00 Mon | BEST,FIRST   | heiheihei   | true    | 1        |
    |1        | Bi       | Dou     | male  | 7  | school 1| G2   | 12:00 - 13:00 Mon | BEST         | hahahaha    | true    | 2        |
    |1        | Ma       | Ni      | male  | 9  | school 2| G3   | 12:00 - 13:00 Mon | FIRST        | hahahaha    | false   | 1        |
    |2        | Ha       | Ii      | male  | 9  | school 2| G3   | 12:00 - 13:00 Mon | FIRST        | hahahaha    | true    | 2        |
    |2        | Wh       | Zi      | male  | 9  | school 2| G3   | 12:00 - 13:00 Mon |              | hahahaha    | false   |          |
    
  Given the following Group exist:
    |title  | admin_id| mentor_id| time_slot         | str_com      | description | visible |
    |group 1| 1       | 1        | 12:00 - 13:00 Mon | FIRST        | heiheihei   | true    |
    |group 2| 2       | 2        | 12:00 - 13:00 Mon | BEST         | heiheihei   | true    |
    
  Given the following Invitation exist:
    | group_id | sender_id | receiver_id| status  |
    | 2        | 1         | 4          | pending |
    | 1        | 5         | 2          | declined|
    
  Given the following Mentor exist:
    |user_id| firstname| lastname| phone       | email          | gender  | date_of_birth | school | grade |time_slot         | competitions | description | visible |
    |2      | Nima     | Cao     | 9796760002  | nima@tamu.edu  | male    | 1993-06-18    | tamu   | U1    |12:00 - 13:00 Mon | ['BEST']     | heiheihei   | false   |
    |3      | Yibi     | keng    | 9796734502  | yibi@tamu.edu  | female  | 1993-06-18    | ecnu   | U2    |12:00 - 13:00 Mon | ['FIRST']    | heiheihei   | true    |
    
  Given I am on the home page of Mentor Matching System
  When I fill in "username" with "user1"
  And I fill in "login_password" with "1q2w3e"
  And I press "Log In"
  
Scenario: see children list
  When I follow "Children"
  Then I should be on the child_index page
  
Scenario: see my children details and edit(happy path)
  When I follow second child's "More"
  Then I should be on the child details page
  When I follow "Edit"
  And I fill in "child_firstname" with "Jiang"
  And I press "Update"
  Then I should see "Jiang"
  
Scenario: see my children details and edit(sad path)
  When I follow second child's "More"
  Then I should be on the child details page
  When I follow "Edit"
  And I fill in "child_firstname" with ""
  And I press "Update"
  Then I should see "The information you put is invalid"
  
Scenario: create a new child account(happy path)
  When I follow "Add Child"
  And I fill in "child_firstname" with "Juding"
  And I fill in "child_lastname" with "Liu"
  And I fill in "child_age" with "7"
  And I fill in "child_school" with "TAMU"
  And I fill in "child_grade" with "G1"
  And I fill in "child_time_slot" with "12:34"
  And I fill in "child_str_com" with "JRLL"
  And I fill in "child_description" with "NiuBi"
  And I choose "male"
  And I check "child_visible"
  And I press "Create"
  Then I should be on the Parent page
  Then I should see "Juding Liu"
  
Scenario: create a new child account(sad path)
  When I follow "Add Child"
  And I fill in "child_firstname" with "Juding"
  And I press "Create"
  Then I should see "The information you put is invalid"
  
Scenario: delete my child accout
  When I follow second child's "More"
  Then I should be on the child details page
  When I follow "Delete"
  Then I should be on the Parent page
  Then I should not see "Bi Dou"