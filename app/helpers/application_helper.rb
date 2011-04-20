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
    if defined? r.CappuccinoScore
      #coffee drinks are worth 4x the score
      totalScore = totalScore + (r.CappuccinoScore * 4)
      totalDenom = totalDenom + 4
    end
    if defined? r.EspressoScore
      #coffee drinks are worth 4x the score
      totalScore = totalScore + (r.EspressoScore * 4)
      totalDenom = totalDenom + 4
    end
    totalScore = totalScore/totalDenom
  end
  
  def scoreToHundred(n)
    #this passes in a number, (should be 0-6, and returns a score from 0 - 100)
    scoreHundred =  41*Math.sqrt(n)
    #this is cloogy to round to the tenths place
    roundScore = ((scoreHundred*10).round).to_f
    returnScore = (roundScore/10) 
  end
end
