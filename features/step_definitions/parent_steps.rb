Given (/^the following (.*) exist:$/) do |type, table| 
    if type == "User"
        table.hashes.each do |element|
            User.create!(element)
        end
    end
    if type == "Parent"
        table.hashes.each do |element|
            Parent.create!(element)
        end
    end
    if type == "Child"
        table.hashes.each do |element|
            Child.create!(element)
        end
    end
    if type == "Invitation"
        table.hashes.each do |element|
            Invitation.create!(element)
        end
    end
    if type == "Group"
        table.hashes.each do |element|
            Group.create!(element)
        end
    end
    if type == "Mentor"
        table.hashes.each do |element|
            Mentor.create!(element)
        end
    end
    
    
end
