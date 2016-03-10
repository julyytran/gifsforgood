class Charity < ActiveRecord::Base
  has_many :gifs

  def link
    if name == "Colorado Coalition Against Sexual Assault"
      "http://www.ccasa.org/"
    elsif name == "Phoenix Multisport"
      "http://www.phoenixmultisport.org/"
    else
      "http://www.givewell.org/international/top-charities/deworm-world-initiative"
    end
  end
end
