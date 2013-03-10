class Logic
  def self.age(birthdate)
    dob = Time.strptime(birthdate, '%m/%d/%Y')
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def self.normalize_date(birthdate)
    if birthdate.match /(\d+)\/(\d+)\/(\d+)/
      month=$1
      day=$2
      year=$3.to_i
    end
    year += 2000 if year < 30
    year += 1900 if year < 1000
    "#{month}/#{day}/#{year}"
  end

  def self.process(params)
    firstname = params['Q1_FIRST']
    lastname = params['Q1_LAST']
    fullname = "#{firstname} #{lastname}"
    birthdate = self.normalize_date(params['Q1_BIRTHDATE'])
    birthplace = params['Q6']
    age = self.age(birthdate)
    ethnicity = params['Q5']

    params['PARAGRAPH_IDENTIFICATION'] = "Mr #{fullname} is a #{age}-year old #{ethnicity} male. He was born in #{birthplace} on #{birthdate}."




    return params

  end
end
