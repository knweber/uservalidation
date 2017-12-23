require 'date'
require 'csv'
require 'email_validator'

helpers do



# Checks all user info, writes invalid users to
# invalid_emails.txt and creates new influencers in DB for valid users

  def check_non_english(str)
    accented_letters = 'ŠšŽžÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÑÒÓÔÕÖØÙÚÛÜÝŸÞàáâãäåæçèéêëìíîïñòóôõöøùúûüýÿþƒ'
    without_accents = 'SsZzAAAAAAACEEEEIIIINOOOOOOUUUUYYBaaaaaaaceeeeiiiinoooooouuuuyybf'

    i = 0
    while i < str.length
      if accented_letters.index(str[i])
        idx = accented_letters.index(str[i])
        to_replace = without_accents[idx]
        str[i] = to_replace
      end
      i += 1
    end
    str
  end

  def invalid_emails(users)
    invalid_users = []

    users.each do |user|
      email = user[7]

      if !EmailValidator.valid?(email) || /gmaill/ =~ email || /example/ =~ email || /.comm/ =~ email
        invalid_users.push("Name: " + user[0] + " " + user[1] + ", Invalid Email: " + user[7] + " \n")
      end
    end

    if invalid_users.length > 0
      File.open('invalid_emails.txt','a+') do |file|
        file.truncate(0) # remove existing records
        file.write(DateTime.now)
        file.write("\n")
        invalid_users.each do |user|
          file.write(user)
          file.write("\n")
        end
      end
      return false
    else
      return true
    end
  end

  def create_influencer(user)
    email = user[7]

    if user[13].downcase == "yes" || user[13].downcase == "y"
      user[13] = true
    else
      user[13] = false
    end

    user[0] = check_non_english(user[0])
    user[1] = check_non_english(user[1])

    influencer = Influencer.create(
      first_name: user[0],
      last_name: user[1],
      address1: user[2],
      address2: user[3],
      city: user[4],
      state: user[5],
      zip: user[6],
      email: email,
      phone: user[8],
      bra_size: user[9],
      top_size: user[10],
      bottom_size: user[11],
      sports_jacket_size: user[12],
      three_item: user[13])

    puts "Influencer created!"
    puts "#{influencer.first_name} #{influencer.last_name},\nID: #{influencer.id},\nEmail: #{influencer.email},\nThree-item: #{influencer.three_item}"

  end

end
