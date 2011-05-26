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
    if !r.nil?
        for singleR in r
        scores = scores + totalScore(singleR)
        denom = denom + 1
        end
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
  
  def decimalPlaces(x, d)
    #this will truncate x to the 10^d decimal place.
    if isNumeric(x) && isNumeric(d)
        big = 10**d
        total = x.to_f * big
        roundScore = (total.round).to_f
        returnScore = (roundScore/big)
    else
        x
    end
  end
  
  def slider(attributes={})
  unless attributes.nil? then
  values=attributes[:values]
  default_value=attributes[:default_value].to_s
  object=attributes[:object].to_s
  instance=attributes[:instance].to_s
  unit=attributes[:unit] || ""
  text_div_id=object + "_" + instance + "_slider_text_div"
  slider_id=object + "_" + instance + "_slider"

  concat(raw(
    "<div id=\"#{slider_id}\" class=\"slider\">
       <div class=\"handle\"></div>
     </div>"
  ))

  concat(raw(hidden_field(object, instance, :value => default_value.to_f)))
  concat(raw("<div id=\"#{text_div_id}\">" + default_value + " " + unit + "</div>"))

  js_text = <<JS3
  (function() {
    var zoom_slider = $('#{slider_id}');
    var text_div = $('#{text_div_id}');
    var hidden_item = $('#{object + "_" + instance}');
    var values=#{values.inspect};

    var values_length = values.length;
    var min=40;
    var max=200;

    var unit = Math.ceil((max - min) / values_length);
    var range = $R(min, max - unit);

    var pix_values = new Array();
    for(i=1;i<=values_length;i++){
      pix_values[i-1]=min + (unit * (i - 1));
    }

    var default_value=pix_values[#{values.index(default_value.to_f)}];

    new Control.Slider(zoom_slider.down('.handle'), zoom_slider, {
      range: range,
      sliderValue: default_value,
            increment: unit,
            values: pix_values,
      onSlide: function(value) {
                text_div.innerHTML=values[pix_values.indexOf(value)] + " #{unit}";
                hidden_item.value=values[pix_values.indexOf(value)];
      },
      onChange: function(value) { 
                text_div.innerHTML=values[pix_values.indexOf(value)] + " #{unit}";
                hidden_item.value=values[pix_values.indexOf(value)];
      }
    });
  })();

JS3
      concat(raw(javascript_tag(js_text)))
  end
end
end
