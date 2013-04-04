class Logic
  def self.age(birthdate)
    dob = Time.strptime(birthdate, '%m/%d/%Y')
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    rescue
      "DATE_FORMAT_ERROR"
  end

  def self.normalize_date(birthdate)
    if birthdate.present? and birthdate.match /(\d+)\/(\d+)\/(\d+)/
      month=$1
      day=$2
      year=$3.to_i
    else
      return "DATE_FORMAT_ERROR"
    end
    year += 2000 if year < 30
    year += 1900 if year < 1000
    "#{month}/#{day}/#{year}"
  end

  def self.process(params)
    firstname = params['Q1_FIRST']
    lastname = params['Q1_LAST']
    fullname = "#{firstname} #{lastname}"
    commaname = "#{lastname}, #{firstname}"
    birthdate = self.normalize_date(params['Q1_BIRTHDATE'])
    birthplace = params['Q6']
    age = self.age(birthdate)
    ethnicity = params['Q5']


    q1_FIRST = params["Q1_FIRST"]
    q1_LAST = params["Q1_LAST"]
    q1_BIRTHDATE = params["Q1_BIRTHDATE"]
    q1_CASENUM = params["Q1_CASENUM"]
    q1_RQID = params["Q1_RQID"]
    q1_ADJUDICATOR = params["Q1_ADJUDICATOR"]
    q1_EXAMDATE = params["Q1_EXAMDATE"]
    q1_EXAMLOC = params["Q1_EXAMLOC"]
    q3 = params["Q3"]
    q4 = params["Q4"]
    q5 = params["Q5"]
    q6 = params["Q6"]
    q8 = params["Q8"]
    q8A = params["Q8A"]
    q9 = params["Q9"]
    q11 = params["Q11"]
    q11A = params["Q11A"]
    q13 = params["Q13"]
    q14 = params["Q14"]
    q14A = params["Q14A"]
    q15 = params["Q15"]
    q16 = params["Q16"]
    q16_Q16F = params["Q16_Q16F"]
    q16_Q16B = params["Q16_Q16B"]
    q16_Q16C = params["Q16_Q16C"]
    q16_Q16D = params["Q16_Q16D"]
    q16_Q16E = params["Q16_Q16E"]
    q16_Q16G = params["Q16_Q16G"]
    q16_Q16A = params["Q16_Q16A"]
    q17 = params["Q17"]
    qA18 = params["QA18"]
    qA18A = params["QA18A"]
    q19 = params["Q19"]
    q179 = params["Q179"]
    q19A = params["Q19A"]
    q20 = params["Q20"]
    q20A = params["Q20A"]
    q21 = params["Q21"]
    q177 = params["Q177"]
    q21A = params["Q21A"]
    q22 = params["Q22"]
    q30 = params["Q30"]
    q31 = params["Q31"]
    q31A = params["Q31A"]
    q31B = params["Q31B"]
    qA33 = params["QA33"]
    qA34 = params["QA34"]
    qA34A = params["QA34A"]
    qA35 = params["QA35"]
    qA35A = params["QA35A"]
    qA36 = params["QA36"]
    qA36A = params["QA36A"]
    qA189 = params["QA189"]
    q23 = params["Q23"]
    q24 = params["Q24"]
    q25 = params["Q25"]
    q26 = params["Q26"]
    q26A = params["Q26A"]
    q27 = params["Q27"]
    q28 = params["Q28"]
    qA37 = params["QA37"]
    qA38 = params["QA38"]
    qA39 = params["QA39"]
    qA40 = params["QA40"]
    qA41 = params["QA41"]
    q42 = params["Q42"]
    q42A = params["Q42A"]
    q42B = params["Q42B"]
    q43 = params["Q43"]
    q45 = params["Q45"]
    q46 = params["Q46"]
    q47 = params["Q47"]
    qA52 = params["QA52"]
    qA53 = params["QA53"]
    qA184 = params["QA184"]
    qA55 = params["QA55"]
    qA186 = params["QA186"]
    qA56 = params["QA56"]
    q48 = params["Q48"]
    q49 = params["Q49"]
    q49A = params["Q49A"]
    q50 = params["Q50"]
    q51 = params["Q51"]
    qA57 = params["QA57"]
    qA57A = params["QA57A"]
    qA58 = params["QA58"]
    qA59 = params["QA59"]
    qA60 = params["QA60"]
    qA60A = params["QA60A"]
    qA61 = params["QA61"]
    qA62 = params["QA62"]
    qA63 = params["QA63"]
    qA63A = params["QA63A"]
    qA63B = params["QA63B"]
    qA63C = params["QA63C"]
    qA64 = params["QA64"]
    q65 = params["Q65"]
    q66 = params["Q66"]
    q66A = params["Q66A"]
    q67 = params["Q67"]
    q68 = params["Q68"]
    q69 = params["Q69"]
    q70 = params["Q70"]
    q71 = params["Q71"]
    q72 = params["Q72"]
    q73 = params["Q73"]
    q73A = params["Q73A"]
    q73B = params["Q73B"]
    q73C = params["Q73C"]
    q10 = params["Q10"]
    q74 = params["Q74"]
    q76 = params["Q76"]
    q77 = params["Q77"]
    q77A = params["Q77A"]
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
    q86A = params["Q86A"]
    q86B = params["Q86B"]
    q86C = params["Q86C"]
    q87 = params["Q87"]
    q87A = params["Q87A"]
    q78 = params["Q78"]
    q78A = params["Q78A"]
    q79 = params["Q79"]
    q80 = params["Q80"]
    q81 = params["Q81"]
    q93 = params["Q93"]
    q94 = params["Q94"]
    q95 = params["Q95"]
    q96 = params["Q96"]
    q98 = params["Q98"]
    q99 = params["Q99"]
    q112 = params["Q112"]
    q113 = params["Q113"]
    q114 = params["Q114"]
    q116 = params["Q116"]
    q121 = params["Q121"]
    q122 = params["Q122"]
    q123B = params["Q123B"]
    q100 = params["Q100"]
    q101 = params["Q101"]
    q102 = params["Q102"]
    q200 = params["Q200"]
    q110 = params["Q110"]
    q135 = params["Q135"]
    q135A = params["Q135A"]
    q136 = params["Q136"]
    q137 = params["Q137"]
    q138 = params["Q138"]
    q125 = params["Q125"]
    q126 = params["Q126"]
    q127 = params["Q127"]
    q128 = params["Q128"]
    q129 = params["Q129"]
    q131 = params["Q131"]
    q132 = params["Q132"]
    q133 = params["Q133"]
    q133A = params["Q133A"]
    q133B = params["Q133B"]
    q144 = params["Q144"]
    q145 = params["Q145"]
    q142 = params["Q142"]
    q142A = params["Q142A"]
    q146 = params["Q146"]
    q146A = params["Q146A"]
    q147 = params["Q147"]
    q150 = params["Q150"]
    q151 = params["Q151"]
    q149_A1 = params["Q149_A1"]
    q149_A2 = params["Q149_A2"]
    q149_A3 = params["Q149_A3"]
    q149_A4 = params["Q149_A4"]
    q149_B1 = params["Q149_B1"]
    q149_B2 = params["Q149_B2"]
    q149_B3 = params["Q149_B3"]
    q149_B4 = params["Q149_B4"]
    q302 = params["Q302"]
    q303 = params["Q303"]
    q304 = params["Q304"]
    q305 = params["Q305"]
    q306 = params["Q306"]
    q153 = params["Q153"]
    qA154 = params["QA154"]
    qA155 = params["QA155"]
    qA155A = params["QA155A"]
    q156 = params["Q156"]
    qA156A = params["QA156A"]
    qA156B = params["QA156B"]
    qA157 = params["QA157"]
    qA157A = params["QA157A"]
    qA157B = params["QA157B"]
    q158 = params["Q158"]
    q159 = params["Q159"]
    q159A = params["Q159A"]
    q160 = params["Q160"]
    q160A = params["Q160A"]
    q181 = params["Q181"]
    q181A = params["Q181A"]
    q299 = params["Q299"]
    q300 = params["Q300"]
    q301 = params["Q301"]
    qA161 = params["QA161"]
    q167 = params["Q167"]
    q168 = params["Q168"]
    q169 = params["Q169"]
    q170 = params["Q170"]
    q162 = params["Q162"]
    q163 = params["Q163"]
    q165 = params["Q165"]
    q165A = params["Q165A"]
    q166 = params["Q166"]
    q171 = params["Q171"]
    q172 = params["Q172"]
    q172A = params["Q172A"]
    q173 = params["Q173"]
    q174 = params["Q174"]
    q175 = params["Q175"]
    q180 = params["Q180"]
    q182 = params["Q182"]
    q183 = params["Q183"]
    qA187 = params["QA187"]
    qA188 = params["QA188"]



    params['PARAGRAPH_IDENTIFICATION'] = "Mr #{fullname} is a #{age}-year old #{ethnicity} male. He was born in #{birthplace} on #{birthdate}."

    params['PARAGRAPH_GENERAL'] = "Mr #{fullname} arrived #{q8}, and was {q8A}"

    #    Mr. FILLIN_Q1_FIRST FILLIN_Q1_LAST arrived FILLIN_Q8_VALUES, and was FILLIN_Q8A_VALUES. He FILLIN_Q9_VALUES.
    #
    #Throughout the interview, he was FILLIN_Q10.
    #
    #He was advised of the limitations on confidentiality and was informed that a copy of the evaluations would be provided to the Social Security Administration. The source of information was Mr. FILLIN_Q1, who FILLIN_Q11 considered a reliable historian. FILLIN_Q11A is the historian for this interview`.
    #

    params['PARAGRAPH_CHIEF_COMPLAINT'] = "Mr #{fullname} is struggling with the following mental health concerns: #{q13}."

    params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] = "Mr. #{fullname} was first diagnosed with #{q13} in #{q14} by #{q14A}. Current symptoms of #{q13} include: #{q16}."

    params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "Special circumstances at the onset of the conditions were: #{q15}" if q15 != "no"

    params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "Mr. #{fullname} #{q16B} traumatic event in #{q16C} in #{q16D}. There #{q16E} current effect of the trauma on his daily functioning. #{q16F} The trauma has affected his life and functioning for #{q16G}."

    params['PARAGRAPH_HISTORY_OF_PRESENT_ILLNESS'] << "The effects of mental health in his daily life are: #{q17}. Mr. #{fullname} stopped working due to his impairments on #{qa18}. #{qa18A} He #{q19} currently in psychotherapy #{q19A}.Psychotherapy #{q20} helpful to Mr.#{fullname}. #{q20AHe} #{q179}.."

    params['PARAGRAPH_CURRENT_MEDICATION'] = "Mr. #{fullname} #{q21} currently taking medications. He reported he #{q21A} take his medications today. They are prescribed by #{q177}."

    params['PARAGRAPH_PAST_PSYCHIATRIC_HISTORY'] = "Mr. #{q1} reports he #{q29} been admitted to a psychiatric hospital."

    params['PARAGRAPH_PAST_PSYCHIATRIC_HISTORY'] << "The last time he was admitted was in #{q30}. The admittance was due to #{q31}. Mr. #{q1} received the following treatment while admitted: #{q31A}. His response to treatment was #{q31B}."

    params['PARAGRAPH_ALCOHOL_AND_OR_DRUG_ABUSE'] = "Mr. #{q1} #{qA32} alcohol, illicit drugs, and tobacco."

    params['PARAGRAPH_ALCOHOL_AND_OR_DRUG_ABUSE'] << "Mr. #{q1} reported abusing #{qA33}. He first used in #{a34} and started using abusively in #{qa34A}. He used the substance #{qa35}. At the worst of times, he used #{qa35A} per day. He #{qa36} abusing the substance. He has been clean for #{qa36A}."

    params['PARAGRAPH_PAST_MEDICAL_HISTORY'] = "Mr. #{q1} #{q23} from a major head injury, which required hospitalization. He #{q24} a lack of consciousness, felt dazed, or saw stars. The injury was sustained in #{q25}; he #{q26} treated at a hospital. The name of the hospital was #{q16A}."

    params['PARAGRAPH_PAST_MEDICAL_HISTORY'] << "Surgeries include: #{q27}."

    params['PARAGRAPH_PAST_MEDICAL_HISTORY'] << "Medical conditions per his report include: #{q28}."

    params['PARAGRAPH_FAMILY_HISTORY'] = "Mr. #{q1} is #{qA37}. #{qA38} He #{qA39} children; #{qA40}. #{qA41} He #{q42} #{q42A} in #{q42B}. There #{q43} history of mental illness in his family. #{q44} There #{q45}history of child abuse in the family. #{q46} #{q47}"

    params['PARAGRAPH_EMPLOYMENT_HISTORY'] = "Mr. #{q1} #{qA52} working. He #{qA53} actively seeking employment at this time. His attitude regarding seeking employment is #{qA184}.The reason he left his last place of employment was “#{qA54}.”"

    params['PARAGRAPH_EMPLOYMENT_HISTORY'] << "He reported having a work history that included the following jobs: #{qA55}".

    params['PARAGRAPH_EMPLOYMENT_HISTORY'] << "He reported the periods of unemployment were due to “#{qA56}.”".

    params['PARAGRAPH_LEGAL_CRIMINAL_HISTORY'] = "Mr. #{q1} #{qA57} arrested for #{qA57A}. The arrest was on #{qA58}, and the outcome was #{qA59}. He #{qA60} incarcerated. The incarceration lasted #{qA60A}."

    params['PARAGRAPH_MILITARY_HISTORY'] = "Mr. #{q1} #{qA61} serving in the military. The dates of services were #{qA62}. The highest rank he held was #{qA63}. He reports he #{qA63A} received any metals, and report disciplinary action #{qA63B} taken. Mr. #{q1} #{qA63C} he was dishonorably discharged. He #{qA64} deployed."

    params['PARAGRAPH_GENERAL_APPEARANCE'] = "Mr. #{q1} appeared #{q65} his stated age. His hygiene was #{q66}; he was #{q66A}.In relation to height, his build was #{q67}.  Eye contact was #{q68}, and his facial expressions were #{q69}. Clothing was #{q70}. He was dressed in #{q71}; which #{q72} appropriate for the weather. There #{q73} evidence of psychomotor agitation, as seen when he #{q73A}. There #{q73B} evidence of psychomotor retardation, as seen when he #{q73C}."

    params['PARAGRAPH_ATTITUDE_&_BEHAVIOR'] = "Mr. #{q1}’s behavior was #{q74}. Attitude was #{q76}. There #{q77} evidence of feigning or factitious behaviors. #{q77A}"

    params['PARAGRAPH_MOOD_AFFECT'] = "He stated that his current mood was #{q88}.  Mr. #{q1}’s affect was #{q89} with the stated mood.  He appeared #{q90}. Regarding sleeping, he stated he has #{q91}.He reports #{q92}."

    params['PARAGRAPH_CONTENT_OF_THOUGHT'] = "Mr. #{q1} #{q82} having auditory hallucinations. #{q83} He #{q84} having visual, tactile, or olfactory hallucinations. #{q85} Mr. #{q1} #{q86} having suicidal ideations. #{q86A} Mr. #{q1} #{q86B} having homicidal ideations. #{q86C} He #{q87} having delusions. #{q87A}"

    params['PARAGRAPH_STREAM_OF_MENTAL_ACTIVITY_SPEECH'] = "Speech form was #{q78}. #{q78A} Articulation was #{q79}. Speech velocity was #{q80}; volume was #{q81}."

    params['PARAGRAPH_ORIENTATION'] = "Mr. #{q1} was oriented #{q93} (Person- #{q94} Place- #{q95} Time- #{q96})."

    params['PARAGRAPH_PSYCHOLOGICAL_ASSESSMENTS'] = "Mr. #{q1} was administered a (insert #{98a}, #{98b}, #{98c})."

    params['PARAGRAPH_TESTING_BEHAVIORS'] = "#{q99}"



    return params
  end
end
