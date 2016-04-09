Feature: User login
  As the administrator of the system
  I would like to get everyone to log in before anything else
  So that I could track them the next time they visit
  
Background: users, parents, children, groups, invitations, mentors in database
  Given the following User exist:
    | username    | password | role     | last_login_time |
    | user1       | 1q2w3e   | Parent   | 1977-05-25      |
    | user2       | 1q2w3e   | Parent   | 1982-06-25      |
    | user3       | 1q2w3e   | Mentor   | 1979-05-25      |

  Given the following Parent exist:
    |user_id | firstname | lastname | phone      | email          |
    |1       | Lei       | Li       | 9796760001 | user1@tamu.edu |
    |4       | Ming      | Xiao     | 9796760004 | user4@tamu.edu |
    |5       | Liangchen | Ye       | 9796760006 | user6@tamu.edu |
    
  Given the following Child exist:
    |parent_id| firstname| lastname| gender| age| school  | grade| time_slot         | str_com         | description | visible | group_id |
    |1        | Alei     | Lei     | male  | 5  | school 1| G1   | 12:00 - 13:00 Mon | BEST，FIRST     | heiheihei   | true    | 1        |
    |1        | Bi       | Dou     | male  | 7  | school 1| G2   | 12:00 - 13:00 Mon | BEST，FIRST     | hahahaha    | true    | 2        |
    |1        | Ma       | Ni      | male  | 9  | school 2| G3   | 12:00 - 13:00 Mon | BEST，FIRST     | hahahaha    | false   | 1        |
    
  Given the following Group exist:
    |title  | admin_id| mentor_id| time_slot         | str_com      | description | visible |
    |group 1| 1       | 1        | 12:00 - 13:00 Mon | BEST         | heiheihei   | true    |
    |group 2| 2       | 2        | 12:00 - 13:00 Mon | FIRST        | heiheihei   | true    |
    
  Given the following Invitation exist:
    | group_id | sender_id | receiver_id| status  |
    | 2        | 1         | 3          | pending |
    | 1        | 2         | 1          | declined|
    
  Given the following Mentor exist:
    |user_id| firstname| lastname| phone       | email          | gender  | date_of_birth | school | grade |time_slot         | competitions | description | visible |
    |2      | Nima     | Cao     | 9796760002  | nima@tamu.edu  | male    | 1993-06-18    | tamu   | U1    |12:00 - 13:00 Mon | ['BEST']     | heiheihei   | false   |
    |6      | Yibi     | keng    | 9796734502  | yibi@tamu.edu  | female  | 1993-06-18    | ecnu   | U2    |12:00 - 13:00 Mon | ['FIRST']    | heiheihei   | true    |
  
  Given I am on the home page of Mentor Matching System


Scenario: mentor login for the first time
  When I fill in "username" with "user3"
  And I fill in "login_password" with "1q2w3e"
  And I press "Log In"
  Then I should be on the New Mentor page
  And I should see "Welcome"
  
Scenario: parent login
  When I fill in "username" with "user1"
  And I fill in "login_password" with "1q2w3e"
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