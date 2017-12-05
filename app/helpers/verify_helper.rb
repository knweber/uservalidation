require 'date'
require 'csv'
require 'email_validator'

helpers do

  def verify_emails(users)
    invalid_users = []
    users.each do |user|
      email = user[7]
      if !EmailValidator.valid?(email) || /gmaill/ =~ email || /example/ =~ email || /comm/ =~ email 
        invalid_users.push("Name: " + user[0] + " " + user[1] + ", Invalid Email: " + user[7] + " \n")
      end
    end

    if invalid_users.length > 0
      File.open('invalid_emails.txt','a+') do |file|
        file.write(DateTime.now)
        file.write("\n")
        invalid_users.each do |user|
          file.write(user)
          file.write("\n")
        end
      end
    end
  end

end
