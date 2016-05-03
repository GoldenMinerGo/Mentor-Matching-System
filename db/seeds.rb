users = [
	{:role => 'Parent', :username => 'Yifan', :last_login_time => DateTime.strptime("12/01/2015 01:00", "%m/%d/%Y %H:%M")},
	{:role => 'Parent', :username => 'Yiding', :last_login_time => DateTime.strptime("10/01/2015 17:05", "%m/%d/%Y %H:%M")},
	{:role => 'Parent', :username => 'Dalao', :last_login_time => DateTime.strptime("11/01/2015 17:00", "%m/%d/%Y %H:%M")},
	{:role => 'Parent', :username => 'Jiang', :last_login_time => DateTime.strptime("12/01/2015 01:00", "%m/%d/%Y %H:%M")},
	{:role => 'Mentor', :username => 'Runkun', :last_login_time => DateTime.strptime("10/01/2015 17:05", "%m/%d/%Y %H:%M")},
	{:role => 'Mentor', :username => 'Lijin', :last_login_time => DateTime.strptime("11/01/2015 17:00", "%m/%d/%Y %H:%M")},
	{:role => 'Mentor', :username => 'Bing', :last_login_time => DateTime.strptime("11/01/2015 17:00", "%m/%d/%Y %H:%M")},
	{:role => 'Administrator', :username => 'Malini', :last_login_time => DateTime.strptime("11/01/2015 17:00", "%m/%d/%Y %H:%M")}
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
	
	{:user_id => User.find(6).id,:username => 'user6', :password => '123456', :encrypted_password => 'TrrtVDttv', :role => 'Mentor'},
	
	{:user_id => User.find(8).id,:username => 'Malini', :password => '123456', :encrypted_password => 'TrrtVDttv', :role => 'Administrator'}
]

rglusers.each do |rgluser|
  Rgluser.create!(rgluser)
end


mentors = [
	{:user_id => User.find(5).id, :firstname => 'Meimei', :lastname => 'Han', :phone => '9796760002', :email => 'user2@tamu.edu', :gender => 'male', :date_of_birth => '1993-06-18', :school => 'School 5', :grade => 'U1', :time_slot => '14285713,23132131,32435223,12313143,43276874,2473627,342425672', :competitions => 'FLL', :description => '...', :visible => true},
	
	{:user_id => User.find(6).id, :firstname => 'Hua', :lastname => 'Wang', :phone => '9796760003', :email => 'user3@tamu.edu', :gender => 'female', :date_of_birth => '1993-06-18', :school => 'School 6', :grade => 'U3', :time_slot => '2317516241,23115644,3474325248,283745265,78245674,24384672,2376428', :competitions => 'Junior FLL', :description => '...', :visible => true}
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

	{:title => 'group 1', :admin_id => Parent.find(1).id, :mentor_id => Mentor.find(1).id, :time_slot => '123214,132144235,23489362,89236572,892364278,372846423,9862347', :competitions => 'FLL', :description => '...', :visible => true, :completed => false, :need_mentor => false},
	
	{:title => 'group 2', :admin_id => Parent.find(2).id, :mentor_id => Mentor.find(2).id, :time_slot => '21893617,2319761,321673871,83927532,389426347,6543572,23742675', :competitions => 'Junior FLL', :description => '...', :visible => true, :completed => false, :need_mentor => false}

]

groups.each do |group|
  Group.create!(group)
end


children = [
	{:parent_id => Parent.find(1).id, :firstname =>'Alei', :lastname => 'Lei', :gender => 'male', :date_of_birth => '2008-06-18', :school => 'School 1', :grade => 'G1', :time_slot => '123256167,2983648276,237866526,7234562,78324536,73284562,78234326', :competitions => 'FLL', :description => '...', :visible => true, :group_id => Group.find(1).id },
	
	{:parent_id => Parent.find(1).id, :firstname =>'Haha', :lastname => 'Oh', :gender => 'female', :date_of_birth => '2009-03-20', :school => 'School 2', :grade => 'G1', :time_slot => '3265422654,122165416,8239742734,273843625,728354625,62345652,2176361537', :competitions => 'Junior FLL', :description => '...', :visible => true, :group_id => Group.find(2).id },
	
	{:parent_id => Parent.find(1).id, :firstname =>'Yeh', :lastname => 'Yeh', :gender => 'male', :date_of_birth => '2010-05-15', :school => 'School 1', :grade => 'G2', :time_slot => '261521673,178231642,7823462,2376842,783264,392764,78326425', :competitions => 'FLL', :description => '...', :visible => false, :group_id => Group.find(1).id },
	
	{:parent_id => Parent.find(2).id, :firstname =>'Heihei', :lastname => 'Hei', :gender => 'female', :date_of_birth => '2009-08-01', :school => 'School 2', :grade => 'G2', :time_slot => '748543656,129836217,324672,27185146,82196381,9725461,19823621', :competitions => 'Junior FLL', :description => '...', :visible => true, :group_id => Group.find(2).id },
	
	{:parent_id => Parent.find(2).id, :firstname =>'Hehe', :lastname => 'Le', :gender => 'male', :date_of_birth => '2007-09-25', :school => 'School 1', :grade => 'G2', :time_slot => '129621264,92374682,3276488623,732854632,237845326,916231,892161', :competitions => 'FLL', :description => '...', :visible => true}
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

administrators = [
	{:user_id => User.find(8).id, :name => 'Malini'},

]


administrators.each do |administrator|
  Administrator.create!(administrator)
end
