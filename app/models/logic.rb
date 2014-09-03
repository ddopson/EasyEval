# encoding: utf-8
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
    else
      return nil
    end
    year += 2000 if year < 30
    year += 1900 if year < 1000
    "#{month}/#{day}/#{year}"
  end

  def self.is_truish(str)
    case str

    when ""          then return false

    when "has"       then return true
    when "has never" then return false

    when "able"       then return true
    when "unable" then return false

    when "reported"       then return true
    when "denies" then return false

    when "does"       then return true
    when "does not" then return false

    when "does have"       then return true
    when "does not have" then return false

    when "has abused"       then return true
    when "has not abused" then return false

    when "has sustained"       then return true
    when "has not sustained" then return false

    when "has taken"       then return true
    when "has not taken" then return false

    when "seems"       then return true
    when "did not seem" then return false

    when "was arrested"       then return true
    when "has never been arrested." then return false

    when "yes"       then return true
    when "no"        then return false
    when " no"        then return false

    when "abcd"        then return false

    when "Yes"       then return true
    when "No"        then return false

    when "is"       then return true
    when "is not" then return false
    when "is no" then return false

    when "involved"       then return true
    when "not involved" then return false

    when "is considered" then return true
    when "is not considered" then return false

    when "has served"       then return true
    when "has not served" then return false

    when "has"       then return true
    when "has not" then return false

    when "was"       then return true
    when "was not" then return false
    when "was no" then return false

    when "are"       then return true
    when "are no" then return false

    when "having"       then return true
    when "having no" then return false

    when "did appear"       then return true
    when "did not appear" then return false

    when "has been"       then return true
    when "has not been" then return false

    when "In a committed relationship"       then return true
    when "Married"       then return true
    when "single" then return false
    when "Divorced" then return false
    when "Getting a divorce" then return false
    when "Other" then return false

    when "is currently"       then return true
    when "is not currently"       then return true
    when "The claimant has no employment history" then return false

    when "is no longer"       then return true 

    else raise "ACK, is_true doesn't understand '#{str}'"
    end
  end


  def self.process(params)
    firstname = params['Q1_FIRST']
    lastname = params['Q1_LAST']
    fullname = "#{firstname} #{lastname}"
    commaname = "#{lastname}, #{firstname}"
    birthdate = self.normalize_date(params['Q1_BIRTHDATE'])
    birthplace = params['Q6']
    age = self.age(birthdate) if birthdate
    ethnicity = params['Q5']
    sex = params['gender']

    if params['gender'] == "Male"
      pronoun = "he"
      cap_pronoun = "He"
      pos_pronoun = "his"
      cap_pos = "His"
      title = "Mr."
    else
      pronoun     = "she"
      cap_pronoun = "She"
      pos_pronoun = "her"
      cap_pos = "Her"
      title = "Ms."
    end


    q1_first = params["Q1_FIRST"]
    last = lastname = q1_last = params["Q1_LAST"]
    q1_birthdate = params["Q1_BIRTHDATE"]
    q1_casenum = params["Q1_CASENUM"]
    q1_rqid = params["Q1_RQID"]
    q1_adjudicator = params["Q1_ADJUDICATOR"]
    q1_examdate = params["Q1_EXAMDATE"]
    q1_examloc = params["Q1_EXAMLOC"]
    q3 = params["Q3"]
    q5 = params["Q5"]
    q6 = params["Q6"]
    q8 = params["Q8"]
    q8a = params["Q8A"]
    q9 = params["q9"]
    q11 = params["Q11"]
    q11a = params["Q11A"]
    q13 = params["Q13"]
    qa14 = params["QA14"]
    q14 = params["Q14"]
    q14a = params["Q14A"]
    q14b = params["Q14B"]
    q15 = params["Q15"]
    q15a = params["Q15A"]
    q16 = params["Q16"]
    q16f = params["Q16_Q16F"]
    q16b = params["Q16_Q16B"]
    q16c = params["Q16_Q16C"]
    q16d = params["Q16_Q16D"]
    q16e = params["Q16_Q16E"]
    q16g = params["Q16_Q16G"]
    q16a = params["Q16_Q16A"]
    qa16e = params["QA16E"]
    q17 = params["Q17"]
    qa18 = params["QA18"]
    qa18a = params["QA18A"]
    q19 = params["Q19"]
    q179 = params["Q179"]
    q19a = params["Q19A"]
    q20 = params["Q20"]
    q20a = params["Q20A"]
    q21 = params["Q21"]
    q177 = params["Q177"]
    q21a = params["Q21A"]
    q22 = params["Q22"]
    q30 = params["Q30"]
    q31 = params["Q31"]
    q31a = params["Q31A"]
    q31b = params["Q31B"]
    qa32 = params["QA32"]
    qa33 = params["QA33"]
    qa34 = params["QA34"]
    qa34a = params["QA34A"]
    qa35 = params["QA35"]
    qa35a = params["QA35A"]
    qa36 = params["QA36"]
    qa36a = params["QA36A"]
    qa189 = params["QA189"]
    qa189b = params["QA189B"]
    q23 = params["Q23"]
    q24 = params["Q24"]
    q25 = params["Q25"]
    q26 = params["Q26"]
    q26a = params["Q26A"]
    q27 = params["Q27"]
    q28 = params["Q28"]
    q29 = params["Q29"]
    qa37 = params["QA37"]
    qa38 = params["QA38"]
    qa39 = params["QA39"]
    qa40 = params["QA40"]
    qa41 = params["QA41"]
    qa41a = params["QA41A"]
    q42 = params["Q42"]
    q42a = params["Q42A"]
    q42b = params["Q42B"]
    q43 = params["Q43"]
    q43a = params["Q43A"]
    q45 = params["Q45"]
    q46 = params["Q46"]
    q47 = params["Q47"]
    qa52 = params["QA52"]
    qa53 = params["QA53"]
    qa184 = params["QA184"]
    qa55 = params["QA55"]
    qa186 = params["QA186"]
    qa186a = params["QA186A"]
    qa56 = params["QA56"]
    q48 = params["Q48"]
    q49 = params["Q49"]
    q49a = params["Q49A"]
    q50 = params["Q50"]
    q51 = params["Q51"]
    qa57 = params["QA57"]
    qa57a = params["QA57A"]
    qa57b = params["QA57B"]
    qa58 = params["QA58"]
    qa59 = params["QA59"]
    qa60 = params["QA60"]
    qa60a = params["QA60A"]
    qa60b = params["QA60B"]
    qa61 = params["QA61"]
    qa62 = params["QA62"]
    qa62a = params["QA62A"]
    qa63 = params["QA63"]
    qa63a = params["QA63A"]
    qa63b = params["QA63B"]
    qa63c = params["QA63C"]
    qa64 = params["QA64"]
    q65 = params["Q65"]
    q66 = params["Q66"]
    q66a = params["Q66A"]
    q67 = params["Q67"]
    q68 = params["Q68"]
    q69 = params["Q69"]
    q70 = params["Q70"]
    q71 = params["Q71"]
    q72 = params["Q72"]
    q73 = params["Q73"]
    q73a = params["Q73A"]
    q73b = params["Q73B"]
    q73c = params["Q73C"]
    q10 = params["Q10"]
    q74 = params["Q74"]
    q76 = params["Q76"]
    q77 = params["Q77"]
    q77a = params["Q77A"]
    q88 = params["Q88"]
    q89 = params["Q89"]
    q90 = params["Q90"]
    q91 = params["Q91"]
    q92 = params["Q92"]
    q82 = params["Q82"]
    q83 = params["Q83"]
    q84 = params["Q84"]
    q85 = params["Q85"]
    q86 = params["Q86"]
    q86a = params["Q86A"]
    q86b = params["Q86B"]
    q86c = params["Q86C"]
    q87 = params["Q87"]
    q87a = params["Q87A"]
    q78 = params["Q78"]
    q78a = params["Q78A"]
    q79 = params["Q79"]
    q80 = params["Q80"]
    q81 = params["Q81"]
    q93 = params["Q93"]
    q94 = params["Q94"]
    q94a = params["Q94A"]
    q95 = params["Q95"]
    q95a = params["Q95A"]
    q96 = params["Q96"]
    q96a = params["Q96A"]
    q98 = params["Q98"]
    q99 = params["Q99"]
    q112 = params["Q112"]
    q113 = params["Q113"]
    q114 = params["Q114"]
    q116 = params["Q116"]
    q121 = params["Q121"]
    q122 = params["Q122"]
    q123b = params["Q123B"]
    q100 = params["Q100"]
    q101 = params["Q101"]
    q102 = params["Q102"]
    q200 = params["Q200"]
    q110 = params["Q110"]
    q135 = params["Q135"]
    q135a = params["Q135A"]
    q136 = params["Q136"]
    q137 = params["Q137"]
    q138 = params["Q138"]
    q125 = params["Q125"]
    q126 = params["Q126"]
    q127 = params["Q127"]
    q128 = params["Q128"]
    q128a = params ["Q128A"]
    q129 = params["Q129"]
    q131 = params["Q131"]
    q132 = params["Q132"]
    q133 = params["Q133"]
    q133a = params["Q133A"]
    q133b = params["Q133B"]
    q144 = params["Q144"]
    q145 = params["Q145"]
    q142 = params["Q142"]
    q142a = params["Q142A"]
    q142aa = params["Q142AA"]
    q142ab = params["Q142AB"]
    q146 = params["Q146"]
    q146aa = params["Q146AA"]
    q146ab = params["Q146AB"]
    q146a = params["Q146A"]
    q146b = params["Q146B"]
    q147 = params["Q147"]
    q150 = params["Q150"]
    q150a = params["Q150a"]
    q151 = params["Q151"]
    q151a = params["Q151a"]
    q149_a1 = params["Q149_A1"]
    q149_a2 = params["Q149_A2"]
    q149_a3 = params["Q149_A3"]
    q149_a4 = params["Q149_A4"]
    q149_b1 = params["Q149_B1"]
    q149_b2 = params["Q149_B2"]
    q149_b3 = params["Q149_B3"]
    q149_b4 = params["Q149_B4"]
    q302 = params["Q302"]
    q303 = params["Q303"]
    q304 = params["Q304"]
    q305 = params["Q305"]
    q306 = params["Q306"]
    q152 = params["Q152"]
    q153 = params["Q153"]
    qa154 = params["QA154"]
    qa154a = params["QA154A"]
    qa155 = params["QA155"]
    qa155a = params["QA155A"]
    q156 = params["Q156"]
    qa156a = params["QA156A"]
    qa156b = params["QA156B"]
    qa157 = params["QA157"]
    qa157a = params["QA157A"]
    qa157b = params["QA157B"]
    q158 = params["Q158"]
    q158a = params["Q158A"]
    q159 = params["Q159"]
    q159a = params["Q159A"]
    q160 = params["Q160"]
    q160a = params["Q160A"]
    q181 = params["Q181"]
    q181a = params["Q181A"]
    q299 = params["Q299"]
    q300 = params["Q300"]
    q301 = params["Q301"]
    q167 = params["Q167"]
    q168 = params["Q168"]
    q167c = params["Q167c"]
    q168c = params["Q168c"]
    q169 = params["Q169"]
    q170 = params["Q170"]
    q162 = params["Q162"]
    q163 = params["Q163"]
    q165 = params["Q165"]
    q165a = params["Q165A"]
    q166 = params["Q166"]
    q171 = params["Q171"]
    q172 = params["Q172"]
    q172a = params["Q172A"]
    q173 = params["Q173"]
    q174 = params["Q174"]
    q175 = params["Q175"]
    q180 = params["Q180"]
    q182 = params["Q182"]
    q183 = params["Q183"]
    qa186 = params["QA186"]
    qa187 = params["QA187"]
    qa188 = params["QA188"]
    q190 = params["Q190"]
    qa161 = params["QA161"]
    qa39a = params["QA39A"]
    q49b = params["Q49B"]
    q49c = params["Q49C"]

    params = {}

    params["Q1_FIRST"] = q1_first
    params["Q1_LAST"] = q1_last
    params["Q1_BIRTHDATE"] = q1_birthdate
    params["Q1_CASENUM"] = q1_casenum
    params["Q1_RQID"] = q1_rqid
    params["Q1_ADJUDICATOR"] = q1_adjudicator
    params["Q1_EXAMDATE"] = q1_examdate
    params["Q1_EXAMLOC"] = q1_examloc
    params['Q3'] = q3
    params['Q142'] = q142
    params['Q142A'] = q142a
    params['Q146'] = q146
    params['Q146A'] = q146a
    params['Q152'] = q152


    params["PARAGRAPH_GENERAL"]                            = ""
    params["PARAGRAPH_CHIEF_COMPLAINT"]                    = ""
    params["PARAGRAPH_REVIEW_OF_RECORDS"]                  = ""
    params["PARAGRAPH_CONFIDENTIALITY"]                    = ""
    params["PARAGRAPH_IDENTIFICATION"]                     = ""
    params["PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS"]         = ""
    params["PARAGRAPH_CURRENT_MEDICATIONS"]                = ""
    params["PARAGRAPH_ALCOHOL_AND_OR_DRUG_ABUSE"]          = ""
    params["PARAGRAPH_PAST_MEDICAL_HISTORY"]               = ""
    params["PARAGRAPH_PAST_PSYCHIATRIC_HISTORY"]           = ""
    params["PARAGRAPH_FAMILY_HISTORY"]                     = ""
    params["PARAGRAPH_EMPLOYMENT_HISTORY"]                 = ""
    params["PARAGRAPH_EDUCATIONAL_HISTORY"]                = ""
    params["PARAGRAPH_LEGAL_CRIMINAL_HISTORY"]             = ""
    params["PARAGRAPH_MILITARY_HISTORY"]                   = ""
    params["PARAGRAPH_GENERAL_APPEARANCE"]                 = ""
    params["PARAGRAPH_ATTITUDE_AND_BEHAVIOR"]              = ""
    params["PARAGRAPH_ORIENTATION"]                        = ""
    params["PARAGRAPH_STREAM_OF_MENTAL_ACTIVITY_SPEECH"]   = ""
    params["PARAGRAPH_MOOD_AFFECT"]                        = ""
    params["PARAGRAPH_CONTENT_OF_THOUGHT"]                 = ""
    params["PARAGRAPH_JUDGEMENT_INSIGHT"]                   = ""
    params["PARAGRAPH_PSYCHOLOGICAL_ASSESSMENTS"]          = ""
    params["PARAGRAPH_TESTING_BEHAVIORS"]                  = ""
    params["PARAGRAPH_MEMORY"]                             = ""
    params["PARAGRAPH_INTELLECTUAL_FUNCTIONING"]           = ""
    params["PARAGRAPH_FUND_OF_KNOWLEDGE_INFORMATION"]      = ""
    params["PARAGRAPH_CALCULATIONS"]                       = ""
    params["PARAGRAPH_CONCENTRATION"]                      = ""
    params["PARAGRAPH_TRAILS"]                             = ""
    params["PARAGRAPH_ACTIVITIES_OF_DAILY_LIVING"]         = ""
    params["PARAGRAPH_SOCIAL_FUNCTIONING"]                 = ""
    params["PARAGRAPH_CONCENTRATION_PERSISTANCE_AND_PACE"] = ""
    params["PARAGRAPH_DECOMPENSATION_AND_DETERIORATION"]   = ""
    params["PARAGRAPH_DSM_IV_DIAGNOSIS"]                   = ""
    params["PARAGRAPH_DISCUSSION_PROGNOSIS"]               = ""
    params["PARAGRAPH_CAPABILITY_OF_MANAGING_FUNDS"]       = ""
    params["PARAGRAPH_MEDICAL_SOURCE_STATEMENT"]           = ""

    last_employment_place = 'FILL_THIS_IN' # ie, use the Q55 table and pull out the "last" row

    params['PARAGRAPH_IDENTIFICATION'] << "#{fullname} is a #{age}-year old #{ethnicity} #{sex.downcase}. #{cap_pronoun} was born in #{birthplace} on #{birthdate}."

    params['PARAGRAPH_GENERAL'] << "#{title} #{lastname} arrived #{q8.downcase}, #{q9.downcase} and was #{q8a.downcase}."

    params['PARAGRAPH_CONFIDENTIALITY'] << "#{cap_pronoun} was advised of the limitations on confidentiality and was informed that a copy of the evaluations would be provided to the Social Security Administration. "
    if is_truish(q11)
      params['PARAGRAPH_CONFIDENTIALITY'] << "The source of information was #{title} #{q1_last}, who #{q11} a reliable historian. "
    else
      params['PARAGRAPH_CONFIDENTIALITY'] << "#{q11a.capitalize} is the historian for this interview. "
    end

    if is_truish(qa14)
      params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "#{title} #{lastname} was first diagnosed with #{q13} in #{q14} by #{q14a}. #{q14b}"
    else
      params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "#{title} #{lastname} has not been previously diagnosed with #{q13}. "
    end
    params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "Current symptoms of #{q13} include: #{q16}. #{cap_pronoun} also reported additional symptoms of: #{q16a.downcase}. "
    if is_truish(q15)
      params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "Special circumstances at the onset of the conditions were: #{q15a}. "
    end
    if is_truish(q16b)
      params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "#{title} #{lastname} #{q16b} experienced a traumatic event in #{q16c} in #{q16d}. " 
    end
    if is_truish(q16e)
      params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "There #{q16e} current effects of the trauma on #{pos_pronoun} daily functioning, described as: #{qa16e}. "
      params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "The trauma has affected #{pos_pronoun} life and functioning since #{q16g}. "
    end
    params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "The effects of mental health in #{pos_pronoun} daily life are as described: #{q17}. "
    params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "#{title} #{lastname} stopped working due to #{pos_pronoun} impairments on #{qa18}. "
    params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "#{cap_pronoun} describes any attempts to return to the workplace as: #{qa18a}. "
    params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "#{cap_pronoun} #{q19} currently in psychotherapy#{q19a}. "

    if is_truish(q19)
      params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "Psychotherapy #{q20} helpful to #{title} #{lastname}. "
    else
      params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "#{cap_pronoun} #{q179}. " 
    end

    if is_truish(q20)
      params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << ""      
    else
      params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "#{q20a}. "
    end

    params['PARAGRAPH_CURRENT_MEDICATIONS'] << "#{title} #{fullname} #{q21} currently taking medication. "

    if is_truish(q21)
      params['PARAGRAPH_CURRENT_MEDICATIONS'] << "#{cap_pronoun} is prescribed #{q22}. #{cap_pronoun} reported #{pronoun} #{q21a} #{pos_pronoun} medications today. They are prescribed by #{q177.downcase}."
    end

    params['PARAGRAPH_PAST_PSYCHIATRIC_HISTORY'] << "#{title} #{lastname} reported #{pronoun} #{q29} been admitted to a psychiatric hospital. "

    if is_truish(q29)
      params['PARAGRAPH_PAST_PSYCHIATRIC_HISTORY'] << "#{cap_pronoun} was last admitted in #{q30}. "
      params['PARAGRAPH_PAST_PSYCHIATRIC_HISTORY'] << "The admittance was due to #{q31}. #{title} #{lastname} received the following treatment while admitted: #{q31a}. "
      params['PARAGRAPH_PAST_PSYCHIATRIC_HISTORY'] << "#{cap_pos} response to treatment was #{q31b.downcase}."
    end
    
    params['PARAGRAPH_ALCOHOL_AND_OR_DRUG_ABUSE']

    if is_truish(qa32)
      params['PARAGRAPH_ALCOHOL_AND_OR_DRUG_ABUSE'] << "#{title} #{last} reported abusing #{qa33.downcase}. "
      params['PARAGRAPH_ALCOHOL_AND_OR_DRUG_ABUSE'] << "#{cap_pronoun} first used in #{qa34.downcase} and started using abusively in #{qa34a}. #{cap_pronoun} used the substance #{qa35}. "
      params['PARAGRAPH_ALCOHOL_AND_OR_DRUG_ABUSE'] << "At the peak of #{pos_pronoun} #{qa33.downcase} abuse, #{pronoun} used #{qa35a.downcase} per day. "
      params['PARAGRAPH_ALCOHOL_AND_OR_DRUG_ABUSE'] << "#{cap_pronoun} #{qa36} abusing the substance. " 
    
        if is_truish(qa36)
          params['PARAGRAPH_ALCOHOL_AND_OR_DRUG_ABUSE'] << ""
        else
          params['PARAGRAPH_ALCOHOL_AND_OR_DRUG_ABUSE'] << "#{cap_pronoun} has been clean for #{qa36a}. "
        end
          params['PARAGRAPH_ALCOHOL_AND_OR_DRUG_ABUSE'] << "During the interview, #{pronoun} #{qa189} to be under the influence of drugs or alcohol."
    
        else 
          params['PARAGRAPH_ALCOHOL_AND_OR_DRUG_ABUSE'] << "#{title} #{last} #{qa32} alcohol, illicit drugs, or tobacco. "
    end

    if is_truish(q23)
      params['PARAGRAPH_PAST_MEDICAL_HISTORY'] << "#{title} #{lastname} #{q23} a major head injury, which required hospitalization. "
      params['PARAGRAPH_PAST_MEDICAL_HISTORY'] << "#{cap_pronoun} #{q24} a lack of consciousness, feeling dazed, or seeing stars. "
      params['PARAGRAPH_PAST_MEDICAL_HISTORY'] << "The injury was sustained in #{q25}; #{pronoun} #{q26} at a hospital."
    end

    if is_truish(q26)
           params['PARAGRAPH_PAST_MEDICAL_HISTORY'] << "The name of the hospital was #{q26a}. "
    else
           params['PARAGRAPH_PAST_MEDICAL_HISTORY'] << ""
    end

    params['PARAGRAPH_PAST_MEDICAL_HISTORY'] << "Surgeries include: #{q27}. "

    params['PARAGRAPH_PAST_MEDICAL_HISTORY'] << "Medical conditions per #{pos_pronoun} report include: #{q28.downcase}."

    if is_truish(qa37)  
      params['PARAGRAPH_FAMILY_HISTORY'] << "#{title} #{lastname} is #{qa37.downcase} and #{pronoun} described the relationship as #{qa38.downcase}. "
    else
      params['PARAGRAPH_FAMILY_HISTORY'] << "#{title} #{lastname} is #{qa37.downcase}. "
    end

    if is_truish(qa39)
      params['PARAGRAPH_FAMILY_HISTORY'] << "#{cap_pronoun} #{qa39} #{qa39a} children: ages #{qa40}. "
    else
      params['PARAGRAPH_FAMILY_HISTORY'] << "#{cap_pronoun} #{qa39} children. "
    end

    if is_truish(qa41a)
      params['PARAGRAPH_FAMILY_HISTORY'] << "#{cap_pronoun} has deceased children: #{qa41}. "
    else
      params['PARAGRAPH_FAMILY_HISTORY'] << ""
    end

    params['PARAGRAPH_FAMILY_HISTORY'] << "#{cap_pronoun} #{q42a.downcase} in #{q42} in #{q42b}. #{cap_pos} family #{q43} a history of mental illness"
    if is_truish(q43)
      params['PARAGRAPH_FAMILY_HISTORY'] << ", described as #{q43a}. "
    else
      params['PARAGRAPH_FAMILY_HISTORY'] << ". "
    end

    params['PARAGRAPH_FAMILY_HISTORY'] << "There #{q45} history of child abuse in the family" 
    if is_truish(q45)
      params['PARAGRAPH_FAMILY_HISTORY'] << ", described as: #{q46}. #{q47} "
    else
      params['PARAGRAPH_FAMILY_HISTORY'] << ". "
    end

    if is_truish(qa52)
      params['PARAGRAPH_EMPLOYMENT_HISTORY'] << "#{title} #{lastname} #{qa52} working. "
        if is_truish(qa53)
          params['PARAGRAPH_EMPLOYMENT_HISTORY'] << "#{cap_pronoun} #{qa53} actively seeking employment at this time. "
          params['PARAGRAPH_EMPLOYMENT_HISTORY'] << "#{cap_pos} attitude regarding seeking employment is #{qa184.downcase}. "
          params['PARAGRAPH_EMPLOYMENT_HISTORY'] << "The reason #{pronoun} left #{pos_pronoun} last place of employment was #{last_employment_place}. "
        end
      params['PARAGRAPH_EMPLOYMENT_HISTORY'] << "#{cap_pronoun} reported having a work history that included the following jobs: #{qa55}. "
    else
      params['PARAGRAPH_EMPLOYMENT_HISTORY'] << "#{title} #{lastname} has no employment history. "
    end
    if is_truish(qa186a)
      params['PARAGRAPH_EMPLOYMENT_HISTORY'] << "#{cap_pronoun} reported #{pronoun} #{qa186a} had periods of unemployment due to #{qa56}. "
    end

    params['PARAGRAPH_EDUCATIONAL_HISTORY'] << "#{title} #{lastname}'s last level of education completed was #{q48}. "
    params['PARAGRAPH_EDUCATIONAL_HISTORY'] << "#{cap_pronoun} reported #{pos_pronoun} academic performance was #{q49.downcase}. "
    params['PARAGRAPH_EDUCATIONAL_HISTORY'] << "Additional relevant information about #{pos_pronoun} academic performance includes: #{q49a}. "
    params['PARAGRAPH_EDUCATIONAL_HISTORY'] << "#{cap_pronoun} #{q49b} involved in school related activities"
    if is_truish(q49b)
      params['PARAGRAPH_EDUCATIONAL_HISTORY'] << " such as: #{q49c}. "
    else
      params['PARAGRAPH_EDUCATIONAL_HISTORY'] << "."
    end

    params['PARAGRAPH_EDUCATIONAL_HISTORY'] << "#{cap_pronoun} #{q50} enrolled in special education courses"
    if is_truish(q50)
      params['PARAGRAPH_EDUCATIONAL_HISTORY'] << " in the following subjects: #{q51}. "
    else
      params['PARAGRAPH_EDUCATIONAL_HISTORY'] << "."
    end




    params['PARAGRAPH_LEGAL_CRIMINAL_HISTORY'] << "#{title} #{lastname} #{qa57}"
    if is_truish(qa57)
      params['PARAGRAPH_LEGAL_CRIMINAL_HISTORY'] << " for #{qa57a}. The most recent arrest was on #{qa58}, and the outcome was #{qa59}. #{cap_pronoun} #{qa57b} been arrested multiple times. "
    end
    if is_truish(qa60)
      params['PARAGRAPH_LEGAL_CRIMINAL_HISTORY'] << "#{cap_pronoun} #{qa60} incarcerated on #{qa60b}. The incarceration lasted #{qa60a}. "
    else
      params['PARAGRAPH_LEGAL_CRIMINAL_HISTORY'] << "#{cap_pronoun} has never been incarcerated. "
    end

    params['PARAGRAPH_MILITARY_HISTORY'] << "#{title} #{lastname} #{qa61} in the military. "
    if is_truish(qa61)
      params['PARAGRAPH_MILITARY_HISTORY'] << "The dates of services were #{qa62} to #{qa62a}. "
      params['PARAGRAPH_MILITARY_HISTORY'] << "The highest rank #{pronoun} held was #{qa63}. "
      params['PARAGRAPH_MILITARY_HISTORY'] << "#{cap_pronoun} #{qa63a} receive medals. "
      params['PARAGRAPH_MILITARY_HISTORY'] << "During #{pos_pronoun} service disciplinary action (e.g. Article 15, Captian's Mast) #{qa63b}. #{title} #{lastname} #{qa63c}. "
      params['PARAGRAPH_MILITARY_HISTORY'] << "#{cap_pronoun} #{qa64} deployed. "
    end

    params['PARAGRAPH_GENERAL_APPEARANCE'] << "#{title} #{lastname} appeared #{q65} #{pos_pronoun} stated age. "
    params['PARAGRAPH_GENERAL_APPEARANCE'] << "#{cap_pronoun} exhibited #{q66.downcase} hygiene; #{pronoun} was #{q66a.downcase}. "
    params['PARAGRAPH_GENERAL_APPEARANCE'] << "#{cap_pronoun} was #{q70} dressed in #{q71}; which #{q72.downcase} for the weather. "
    params['PARAGRAPH_GENERAL_APPEARANCE'] << "In relation to height, #{pos_pronoun} build was #{q67.downcase}. "
    params['PARAGRAPH_GENERAL_APPEARANCE'] << "During the interview #{pos_pronoun} eye contact was #{q68.downcase} and #{pos_pronoun} facial expressions were #{q69.downcase}. "

    params['PARAGRAPH_ATTITUDE_AND_BEHAVIOR'] << "#{fullname} was #{q10.downcase} throughout the interview. #{cap_pos} behavior was #{q74.downcase} and #{pos_pronoun} attitude was #{q76.downcase}. " 
    params['PARAGRAPH_ATTITUDE_AND_BEHAVIOR'] << "There #{q77} evidence of malingering or factitious behavior. "
    if is_truish(q77)
      params['PARAGRAPH_ATTITUDE_AND_BEHAVIOR'] << "Such behavior was evidenced by: #{q77a}. "
    end

    if is_truish(q93)
      params['PARAGRAPH_ORIENTATION'] << "#{fullname} was orientated to person, place, and time."
    else
      params['PARAGRAPH_ORIENTATION'] << "#{fullname} was not fully orientated to person, place, and time. "
        if is_truish(q94)
          params['PARAGRAPH_ORIENTATION'] << ""
        else
          params['PARAGRAPH_ORIENTATION'] << "#{cap_pronoun} was not oriented to person, as evidenced by: #{q94a.capitalize}. "
        end
        if is_truish(q95)
          params['PARAGRAPH_ORIENTATION'] << ""
        else
          params['PARAGRAPH_ORIENTATION'] << "#{cap_pronoun} was not oriented to place, as evidenced by: #{q95a}. "
        end
        if is_truish(q96)
          params['PARAGRAPH_ORIENTATION'] << ""
        else
          params['PARAGRAPH_ORIENTATION'] << "#{cap_pronoun} was not oriented to time, as evidenced by: #{q96a}. "
        end
    end

    params['PARAGRAPH_STREAM_OF_MENTAL_ACTIVITY_SPEECH'] << "#{fullname}'s speech #{q78} logical and coherent"
    if is_truish(q78)
      params['PARAGRAPH_STREAM_OF_MENTAL_ACTIVITY_SPEECH'] << ". " 
    else
      params['PARAGRAPH_STREAM_OF_MENTAL_ACTIVITY_SPEECH'] << " as evidenced by: #{q78a}. "
    end
    params['PARAGRAPH_STREAM_OF_MENTAL_ACTIVITY_SPEECH'] << "Articulation was #{q79.downcase}. "
    params['PARAGRAPH_STREAM_OF_MENTAL_ACTIVITY_SPEECH'] << "The velocity of #{pos_pronoun} speech was #{q80.downcase}; volume was #{q81.downcase}. "

    params['PARAGRAPH_MOOD_AFFECT'] << "#{fullname} exhibited #{q190} level of consciousness. "
    params['PARAGRAPH_MOOD_AFFECT'] << "#{cap_pronoun} stated that #{pos_pronoun} current mood was #{q88.downcase}. "
    params['PARAGRAPH_MOOD_AFFECT'] << "#{title} #{lastname}’s affect #{q89} consistent with #{pos_pronoun} stated mood. "
    if is_truish(q89)
      params['PARAGRAPH_MOOD_AFFECT'] << ""
    else
      params['PARAGRAPH_MOOD_AFFECT'] << "The claimant appeared #{q90}. " 
    end
    params['PARAGRAPH_MOOD_AFFECT'] << "Regarding sleeping, #{pronoun} stated #{pronoun} has #{q91.downcase}. #{cap_pronoun} reported #{q92.downcase}. "

    params['PARAGRAPH_CONTENT_OF_THOUGHT'] << "#{title} #{lastname} #{q82} having auditory hallucinations" 
    if is_truish(q82)
      params['PARAGRAPH_CONTENT_OF_THOUGHT'] << ", described as: #{q83}. "
    else
      params['PARAGRAPH_CONTENT_OF_THOUGHT'] << ". "
    end
    params['PARAGRAPH_CONTENT_OF_THOUGHT'] << "#{cap_pronoun} #{q84} having visual, tactile, or olfactory hallucinations"
    if is_truish(q84)
      params['PARAGRAPH_CONTENT_OF_THOUGHT'] << ", described as: #{q85}. "
    else
      params['PARAGRAPH_CONTENT_OF_THOUGHT'] << ". "
    end 
    params['PARAGRAPH_CONTENT_OF_THOUGHT'] << "#{cap_pronoun} #{q87} have delusions"
    if is_truish(q87)
      params['PARAGRAPH_CONTENT_OF_THOUGHT'] << ", described as: #{q87a}. "
    else
      params['PARAGRAPH_CONTENT_OF_THOUGHT'] << ". "
    end 
    params['PARAGRAPH_CONTENT_OF_THOUGHT'] << "#{title} #{lastname} #{q86} have suicidal ideations"
    if is_truish(q87)
      params['PARAGRAPH_CONTENT_OF_THOUGHT'] << ", described as: #{q86a}. "
    else
      params['PARAGRAPH_CONTENT_OF_THOUGHT'] << ". "
    end 
    params['PARAGRAPH_CONTENT_OF_THOUGHT'] << "#{cap_pronoun} #{q86b} homicidal ideations"
    if is_truish(q87)
      params['PARAGRAPH_CONTENT_OF_THOUGHT'] << ", described as: #{q86c}."
    else
      params['PARAGRAPH_CONTENT_OF_THOUGHT'] << ". "
    end  

    params['PARAGRAPH_JUDGEMENT_INSIGHT'] << "#{title} #{lastname}’s insight into #{pos_pronoun} condition was #{q147.downcase}. "
    params['PARAGRAPH_JUDGEMENT_INSIGHT'] << "#{cap_pronoun} showed evidence of #{q152.downcase} judgment when responding to the questions regarding the movie theater fire and lost purse"
    if /Incorrect/.match(q151)
      params['PARAGRAPH_JUDGEMENT_INSIGHT'] << ". #{cap_pronoun} gave this incorrect response regarding a lost purse: #{q151a}"
    else
      params['PARAGRAPH_JUDGEMENT_INSIGHT'] << ". "
    end  
    if /Incorrect/.match(q150)
      params['PARAGRAPH_JUDGEMENT_INSIGHT'] << ". #{cap_pronoun} gave this incorrect response regarding smelling smoke in a movie theater: #{q150a}."
    else
      params['PARAGRAPH_JUDGEMENT_INSIGHT'] << ". "
    end  

    params['PARAGRAPH_PSYCHOLOGICAL_ASSESSMENTS'] << "#{cap_pronoun} was administered a #{q98}."
    params['PARAGRAPH_PSYCHOLOGICAL_ASSESSMENTS'] << "Additional tests include: #{q303}, and #{q305}."

    params['PARAGRAPH_TESTING_BEHAVIORS'] << "The claimant's testing behavior was as described: #{q99}."

    params['PARAGRAPH_MEMORY'] << "Remote memory was #{q121} as evidenced by #{pos_pronoun} ability to recount biographical history and other past events. "
    params['PARAGRAPH_MEMORY'] << "Regarding recent memory, #{pronoun} can remember #{q122}/3 objects after a five-minute delay. "
    params['PARAGRAPH_MEMORY'] << "Immediate memory for digits forward was (insert 123 column 2); digits backward was (insert 123 column 4). "
    params['PARAGRAPH_MEMORY'] << "If using Psychological Testing: "
    params['PARAGRAPH_MEMORY'] << "INDEX SCORES: #{q112} "
    params['PARAGRAPH_MEMORY'] << "SUBTEST SCORES: #{q113} "
    params['PARAGRAPH_MEMORY'] << "COMMENTS: #{q114} "

    params['PARAGRAPH_INTELLECTUAL_FUNCTIONING'] << "#{title} #{lastname}’s intellectual functioning appeared to be in the #{q110} range as evidenced by vocabulary and ability to express thoughts. "
    params['PARAGRAPH_INTELLECTUAL_FUNCTIONING'] << "If using Psychological Testing: "
    params['PARAGRAPH_INTELLECTUAL_FUNCTIONING'] << "INDEX SCORES: #{q100} "
    params['PARAGRAPH_INTELLECTUAL_FUNCTIONING'] << "SUBTEST SCORES: #{q101} "
    params['PARAGRAPH_INTELLECTUAL_FUNCTIONING'] << "COMMENTS: #{q102} "

    params['PARAGRAPH_FUND_OF_KNOWLEDGE_INFORMATION'] << "#{title} #{lastname}’s fund of knowledge #{q127} consistent with #{pos_pronoun} education level and background. "
    params['PARAGRAPH_FUND_OF_KNOWLEDGE_INFORMATION'] << "#{cap_pronoun} #{q128} of current events. #{cap_pronoun} answered #{q129}/6 questions correctly. "
    params['PARAGRAPH_FUND_OF_KNOWLEDGE_INFORMATION'] << "If using Psychological Testing: "
    params['PARAGRAPH_FUND_OF_KNOWLEDGE_INFORMATION'] << "#{fullname}’s fund of knowledge is #{q125.downcase} when compared to #{pos_pronoun} peers, as seen on the intelligence assessment (scaled score is #{q126}). "

    params['PARAGRAPH_CALCULATIONS'] << "#{title} #{lastname} correctly answered #{q133}/5 basic math problems. #{cap_pronoun} was #{q133a}. "
    params['PARAGRAPH_CALCULATIONS'] << "#{title} #{lastname} was able to correctly answer #{q133b}/2 word problems. "
    params['PARAGRAPH_CALCULATIONS'] << "This is based on ability to perform basic mathematical calculations and perform serials. "
    params['PARAGRAPH_CALCULATIONS'] << "If using Psychological Testing: "
    params['PARAGRAPH_CALCULATIONS'] << "This is based on #{pos_pronoun} ability to perform basic mathematical calculations as evidenced in the intelligence assessment. "
    params['PARAGRAPH_CALCULATIONS'] << "#{cap_pronoun} performance was #{q131.downcase} (scaled score is #{q132}). "

    params['PARAGRAPH_CONCENTRATION'] << "#{title} #{lastname} #{q136}. #{cap_pronoun} was #{q137} to spell world forward and #{q138} to spell world backward. "
    params['PARAGRAPH_CONCENTRATION'] << "If using Psychological Testing: "
    params['PARAGRAPH_CONCENTRATION'] << "#{cap_pos} ability to sustain attention, concentration, and exert mental control is in the #{q135.downcase} range (WMI = #{q135a}). "

    params['PARAGRAPH_TRAILS'] << "As part of the evaluation, #{title} #{lastname} was administered Trails Making A and B. "
    params['PARAGRAPH_TRAILS'] << "Trails Making A and B are tests of visual conceptual and visuomotor tracking; it involves motor speed and attention functions. "
    params['PARAGRAPH_TRAILS'] << "Rote memory and motor speed is demonstrated on Trail A. Cognitive flexibility, planning and the ability to maintain focused attention is demonstrated on Trail B. "

    params['PARAGRAPH_ACTIVITIES_OF_DAILY_LIVING'] << "#{title} #{lastname}’s typical day is: #{q153}. "
    params['PARAGRAPH_ACTIVITIES_OF_DAILY_LIVING'] << "#{cap_pronoun} reported being able to complete tasks of #{qa154.downcase} on #{pos_pronoun} own. "
    params['PARAGRAPH_ACTIVITIES_OF_DAILY_LIVING'] << "#{cap_pronoun} #{q156}. #{cap_pronoun} is #{qa156a} to handle #{pos_pronoun} personal finances. "

    if is_truish(qa156a)
      params['PARAGRAPH_ACTIVITIES_OF_DAILY_LIVING'] << ""
    else
      params['PARAGRAPH_ACTIVITIES_OF_DAILY_LIVING'] << "#{cap_pos} finances are handled by #{qa156b}. "
    end

    if is_truish(qa154a)
      params['PARAGRAPH_ACTIVITIES_OF_DAILY_LIVING'] << "#{cap_pronoun} reported requiring help with #{qa155.downcase}. #{qa155a.capitalize} helps with these tasks. "
    end

    params['PARAGRAPH_SOCIAL_FUNCTIONING'] << "#{title} #{lastname} reported #{qa157} social friends. "
    if is_truish(qa157)
      params['PARAGRAPH_SOCIAL_FUNCTIONING'] << ""
    else
      params['PARAGRAPH_SOCIAL_FUNCTIONING'] << "#{cap_pronoun} #{qa157a} isolated from others. "
    end
    params['PARAGRAPH_SOCIAL_FUNCTIONING'] << "#{cap_pronoun} is #{q158} in an organized group"
    if is_truish(q158)
      params['PARAGRAPH_SOCIAL_FUNCTIONING'] << " such as: #{q158a}. "
    else
      params['PARAGRAPH_SOCIAL_FUNCTIONING'] << ". "  
    end
    params['PARAGRAPH_SOCIAL_FUNCTIONING'] << "#{cap_pronoun} #{q159} participate in recreational activities. A house of worship #{q159a} regularly attended. #{cap_pronoun} #{q160} have a history of violence"
    if is_truish(q160)
      params['PARAGRAPH_SOCIAL_FUNCTIONING'] << ", described as: #{q160a}. "
    else
      params['PARAGRAPH_SOCIAL_FUNCTIONING'] << ". "
    end

    params['PARAGRAPH_CONCENTRATION_PERSISTANCE_AND_PACE'] << "#{title} #{lastname} is able to engage in and sustain the following activities for the stated length of time. "
 
    params['PARAGRAPH_DECOMPENSATION_AND_DETERIORATION'] << "There #{q167} evidence of deterioration and decompensation in the workplace"
    if is_truish(q167)
      params['PARAGRAPH_DECOMPENSATION_AND_DETERIORATION'] << ", evidenced by #{q168.downcase}. "
    else
      params['PARAGRAPH_DECOMPENSATION_AND_DETERIORATION'] << ". "
    end 
    params['PARAGRAPH_DECOMPENSATION_AND_DETERIORATION'] << "#{cap_pos} ability to engage in former work activities #{q169} impacted because of the reported mental health issues and physical limitations. "
    params['PARAGRAPH_DECOMPENSATION_AND_DETERIORATION'] << "#{cap_pronoun} reported difficulties with #{q170.downcase}. "

    params['PARAGRAPH_DSM_IV_DIAGNOSIS'] << "Axis I: #{q162} "
    params['PARAGRAPH_DSM_IV_DIAGNOSIS'] << "Axis II: #{q163} "
    params['PARAGRAPH_DSM_IV_DIAGNOSIS'] << "Axis III: #{cap_pronoun} reported: #{q28} "
    params['PARAGRAPH_DSM_IV_DIAGNOSIS'] << "Axis IV: Stressors are: #{q165}. Comments: #{q165a} "
    params['PARAGRAPH_DSM_IV_DIAGNOSIS'] << "Axis V: Current GAF is #{q166}. "

    params['PARAGRAPH_DISCUSSION_PROGNOSIS'] << "#{title} #{lastname} #{q171} able to respond to questions in an open and honest manner. There #{q172} to be evidence of exaggerating symptoms" 
    if is_truish(q172)
      params['PARAGRAPH_DISCUSSION_PROGNOSIS'] << ", described as: #{q172a}. "
    else
      params['PARAGRAPH_DISCUSSION_PROGNOSIS'] << ". "
    end
    params['PARAGRAPH_DISCUSSION_PROGNOSIS'] << "There #{q173} to be inconsistencies throughout the evaluation"
    if is_truish(q173)
      params['PARAGRAPH_DISCUSSION_PROGNOSIS'] << ", as described: #{q174}. "
    else
      params['PARAGRAPH_DISCUSSION_PROGNOSIS'] << ". "
    end
    params['PARAGRAPH_DISCUSSION_PROGNOSIS'] << "#{title} #{lastname} is #{q175} to receive treatment as demonstrated by #{pos_pronoun} history with previous compliance. "
    params['PARAGRAPH_DISCUSSION_PROGNOSIS'] << "#{cap_pos} willingness to use available resources is #{q180.downcase}; #{pos_pronoun} support system is #{q181.downcase}, and includes #{q181a}. "
    params['PARAGRAPH_DISCUSSION_PROGNOSIS'] << "The likelihood of #{pos_pronoun} mental health condition improving in the next 12 months is #{q182.downcase}. "
    params['PARAGRAPH_DISCUSSION_PROGNOSIS'] << "#{cap_pos} ability to respond to routine changes in the workplace is #{q183.downcase}. "
    params['PARAGRAPH_DISCUSSION_PROGNOSIS'] << "#{cap_pos} work history is #{qa186.downcase}. "

    params['PARAGRAPH_CAPABILITY_OF_MANAGING_FUNDS'] << "#{title} #{lastname}’s ability to manage benefits in #{pos_pronoun} own best interest is #{qa187.downcase}. #{cap_pronoun} #{qa188} need a protective payee. "

    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "The ability to reason is #{q146b} as evidenced by #{pos_pronoun} responses to the intellectual questions. "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "#{cap_pronoun} showed evidence of #{q152.downcase} judgment when responding to the questions regarding the movie theater fire and lost purse. "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "#{cap_pronoun} was able to correctly answer #{q133b}/2 word problems involving extraneous information. "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "Memory functions are #{q123b.downcase} as indicated by #{pos_pronoun} responses to the interview questions. "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "Recent memory was q122a as evidenced by #{pos_pronoun} ability to remember #{q122}/3 objects after five minutes. "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "Immediate memory was (insert what?) as evidenced by the ability to hold (insert 123-column 2) digits. "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "Remote memory was #{q121} as evidenced by #{pos_pronoun} ability to recount biographical history and other past events. "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "Sustained concentration and persistence is #{q136}. "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "#{cap_pronoun} correctly answered #{q133}/5 basic math problems. "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "Regarding serials, #{pronoun} was #{q133a}. #{cap_pronoun} #{q156}. "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "Based upon the mental status examination, there #{qa189} to be evidence #{pronoun} was engaging in substance abuse at the time of the evaluation. "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "If using psychological testing: "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "The ability to reason abstractly is in the #{q144.downcase} range as evidenced by #{pos_pronoun} performance on the psychological tests and interpreting proverbs. "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "#{cap_pronoun} showed evidence of #{q152.downcase} judgment when responding to the questions regarding the movie theater fire and lost purse. "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "Memory functions are #{q116.downcase} as indicated by #{pos_pronoun} performance on the psychological assessments. "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "#{fullname}’s fund of knowledge is #{q125.downcase} when compared to #{pos_pronoun} peers. "
    params['PARAGRAPH_MEDICAL_SOURCE_STATEMENT'] << "#{cap_pos} ability to solve basic mathematical problems is #{q131.downcase}. #{cap_pronoun} #{q156}. "

    return params
  end
end
