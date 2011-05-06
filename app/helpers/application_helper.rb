module ApplicationHelper

  def connected_providers_for(user)
    user.user_tokens.collect{|u| u.provider.to_sym }
  end

  def unconnected_providers_for(user)
    User.omniauth_providers - user.user_tokens.collect{|u| u.provider.to_sym }
  end

  def notice_html
    "<div class=\"notice\">#{notice}</div>" unless notice.blank?
  end

  def alert_html
    "<div class=\"alert\">#{alert}</div>" unless alert.blank?
  end
  
  def totalScore(r)
    #this takes a Review dataset.
    totalScore = r.AtmosphereScore + r.PersonalityScore
    totalDenom = 2
    if !r.CappuccinoScore.nil?
      #coffee drinks are worth 4x the score
      totalScore = totalScore + (r.CappuccinoScore * 4)
      totalDenom = totalDenom + 4
    end
    if !r.EspressoScore.nil?
      #coffee drinks are worth 4x the score
      totalScore = totalScore + (r.EspressoScore * 4)
      totalDenom = totalDenom + 4
    end
    total = totalScore/totalDenom
    roundScore = ((total*100).round).to_f
    returnScore = (roundScore/100)
  end
  
  def shopScore(r)
    #this takes multiple Reviews and gives you back a total score.
    #TODO: we may need a fancier system in the future that has more weight on newer reviews?
    scores = 0
    denom = 0
    for singleR in r
      scores = scores + totalScore(singleR)
      denom = denom + 1
    end
    if denom == 0
        returnScore = 0
    else
        total = scores/denom
        roundScore = ((total*10).round).to_f
        returnScore = (roundScore/10) 
    end
  end
  
  def scoreToHundred(n)
    #this passes in a number, (should be 0-6, and returns a score from 0 - 100)
    scoreHundred =  41*Math.sqrt(n)
    #this is cloogy to round to the tenths place
    roundScore = ((scoreHundred*10).round).to_f
    returnScore = (roundScore/10) 
  end
  

  def isNumeric(s)
    begin
        Float(s)
    rescue
        false # not numeric
    else
        true # numeric
    end
  end
  
  def calcDistance(x1, y1, x2, y2) 
    #this will calculate the distance between two sets of latitude and longitude
    dist = Math.sqrt( ((x1-x2)**2) + ((y1-y2)**2))
    distMiles = dist * 69.078 
    roundScore = ((distMiles*100).round).to_f
    returnScore = (roundScore/100)
  end
  
end
