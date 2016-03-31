Given(/^the following (.*) exist:$/) do |table| 
  table.hashes.each do |element|
      $1.create(element)
  end
end
