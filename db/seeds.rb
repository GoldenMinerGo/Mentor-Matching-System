users = [
	{:role => 'Parent', :username => 'Yifan', :last_login_time => DateTime.strptime("12/01/2015 01:00", "%m/%d/%Y %H:%M")},
	{:role => 'Parent', :username => 'Yiding', :last_login_time => DateTime.strptime("10/01/2015 17:05", "%m/%d/%Y %H:%M")},
	{:role => 'Parent', :username => 'Dalao', :last_login_time => DateTime.strptime("11/01/2015 17:00", "%m/%d/%Y %H:%M")},
	{:role => 'Parent', :username => 'Jiang', :last_login_time => DateTime.strptime("12/01/2015 01:00", "%m/%d/%Y %H:%M")},
	{:role => 'Mentor', :username => 'Runkun', :last_login_time => DateTime.strptime("10/01/2015 17:05", "%m/%d/%Y %H:%M")},
	{:role => 'Mentor', :username => 'Lijin', :last_login_time => DateTime.strptime("11/01/2015 17:00", "%m/%d/%Y %H:%M")},
	{:role => 'Mentor', :username => 'Bing', :last_login_time => DateTime.strptime("11/01/2015 17:00", "%m/%d/%Y %H:%M")}
]
users.each do |user|
  User.create!(user)
end

rglusers = [
	{:user_id => User.find(1).id, :username => 'user1', :password => '123456', :encrypted_password => 'GSetrdVGt', :role => 'Parent'},
	
	{:user_id => User.find(2).id, :username => 'user2', :password => '123456', :encrypted_password => 'g3fw4f43rf', :role => 'Parent'},
	{:user_id => User.find(5).id, :username => 'user3', :password => '123456', :encrypted_password => 'TrrtVDttv', :role => 'Mentor'},
	
	{:user_id => User.find(4).id, :username => 'user4', :password => '123456', :encrypted_password => 'TbRSTVStf', :role => 'Parent'},
	
	{:user_id => User.find(3).id, :username => 'user5', :password => '123456', :encrypted_password => 'g3fw4f43rf', :role => 'Parent'},
	
	{:user_id => User.find(6).id,:username => 'user6', :password => '123456', :encrypted_password => 'TrrtVDttv', :role => 'Mentor'}
]

rglusers.each do |rgluser|
  Rgluser.create!(rgluser)
end


mentors = [
	{:user_id => User.find(5).id, :firstname => 'Meimei', :lastname => 'Han', :phone => '9796760002', :email => 'user2@tamu.edu', :gender => 'male', :date_of_birth => '1993-06-18', :school => 'School 5', :grade => 'U1', :time_slot => '0xFF0,0xABF05,0x123456,0x3BCA05,0xABBDA6,0x142857,0x285714', :competitions => 'FLL', :description => '...', :visible => true},
	
	{:user_id => User.find(6).id, :firstname => 'Hua', :lastname => 'Wang', :phone => '9796760003', :email => 'user3@tamu.edu', :gender => 'female', :date_of_birth => '1993-06-18', :school => 'School 6', :grade => 'U3', :time_slot => '0x857142,0x571428,0x714285,0x428571,0xFABC0,0xEAE990,0xABACADA', :competitions => 'Junior FLL', :description => '...', :visible => true}
]

mentors.each do |mentor|
  Mentor.create!(mentor)
end


parents = [
	{:user_id => User.find(1).id, :firstname => 'Lei', :lastname => 'Li', :phone => '9796760001', :email => 'user1@tamu.edu'},
	
	{:user_id => User.find(2).id, :firstname => 'Ming', :lastname => 'Xiao', :phone => '9796760004', :email => 'user4@tamu.edu'},
	
	{:user_id => User.find(3).id, :firstname => 'Ritian', :lastname => 'Zhao', :phone => '9796760005', :email => 'user5@tamu.edu'},
	
	{:user_id => User.find(4).id, :firstname => 'Liangchen', :lastname => 'Ye', :phone => '9796760006', :email => 'user6@tamu.edu'}
]

parents.each do |parent|
  Parent.create!(parent)
end


groups = [

	{:title => 'group 1', :admin_id => Parent.find(1).id, :mentor_id => Mentor.find(1).id, :time_slot => '0x857142,0x571428,0x714285,0x428571,0xFABC0,0xEAE990,0xABACADA', :competitions => 'FLL', :description => '...', :visible => true, :completed => false, :need_mentor => true},
	
	{:title => 'group 2', :admin_id => Parent.find(2).id, :mentor_id => Mentor.find(2).id, :time_slot => '0x857142,0x571428,0x714285,0x428571,0xFABC0,0xEAE990,0xABACADA', :competitions => 'Junior FLL', :description => '...', :visible => true, :completed => false, :need_mentor => true}

]

groups.each do |group|
  Group.create!(group)
end


children = [
	{:parent_id => Parent.find(1).id, :firstname =>'Alei', :lastname => 'Lei', :gender => 'male', :date_of_birth => '2008-06-18', :school => 'School 1', :grade => 'G1', :time_slot => '0x857142,0x571428,0x714285,0x428571,0xFABC0,0xEAE990,0xABACADA', :competitions => 'FLL', :description => '...', :visible => true, :group_id => Group.find(1).id },
	
	{:parent_id => Parent.find(1).id, :firstname =>'Haha', :lastname => 'Oh', :gender => 'female', :date_of_birth => '2009-03-20', :school => 'School 2', :grade => 'G1', :time_slot => '0x857142,0x571428,0x714285,0x428571,0xFABC0,0xEAE990,0xABACADA', :competitions => 'Junior FLL', :description => '...', :visible => true, :group_id => Group.find(2).id },
	
	{:parent_id => Parent.find(1).id, :firstname =>'Yeh', :lastname => 'Yeh', :gender => 'male', :date_of_birth => '2010-05-15', :school => 'School 1', :grade => 'G2', :time_slot => '0x857142,0x571428,0x714285,0x428571,0xFABC0,0xEAE990,0xABACADA', :competitions => 'FLL', :description => '...', :visible => false, :group_id => Group.find(1).id },
	
	{:parent_id => Parent.find(2).id, :firstname =>'Heihei', :lastname => 'Hei', :gender => 'female', :date_of_birth => '2009-08-01', :school => 'School 2', :grade => 'G2', :time_slot => '0x857142,0x571428,0x714285,0x428571,0xFABC0,0xEAE990,0xABACADA', :competitions => 'Junior FLL', :description => '...', :visible => true, :group_id => Group.find(2).id },
	
	{:parent_id => Parent.find(2).id, :firstname =>'Hehe', :lastname => 'Le', :gender => 'male', :date_of_birth => '2007-09-25', :school => 'School 1', :grade => 'G2', :time_slot => '0x857142,0x571428,0x714285,0x428571,0xFABC0,0xEAE990,0xABACADA', :competitions => 'FLL', :description => '...', :visible => true}
]

children.each do |child|
  Child.create!(child)
end


invitations = [
	{:group_id => Group.find(2).id, :sender_id => Child.find(1).id, :receiver_id => Child.find(4).id, :status => 'Pending'},

	{:group_id => Group.find(1).id, :sender_id => Child.find(5).id, :receiver_id => Child.find(2).id, :status => 'Declined'}
]


invitations.each do |invitation|
  Invitation.create!(invitation)
end

groupinvs = [
	{:group_id => Group.find(2).id, :mentor_id => Mentor.find(2).id, :status => 'Pending'},
	
	{:group_id => Group.find(1).id, :mentor_id => Mentor.find(1).id, :status => 'Pending'}
]


groupinvs.each do |groupinv|
  Groupinv.create!(groupinv)
end