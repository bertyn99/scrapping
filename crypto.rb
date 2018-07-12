require 'nokogiri'
require 'open-uri'


def get_crypto_value
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    nomcrypto =doc.css('td.no-wrap.currency-name a.currency-name-container.link-secondary').map{ |lien| 
    lien.text }
    valcrypto = doc.css('td > a.price').map{|lien| 
        lien.text }
        val_without_dollar=valcrypto.map{|n| n.gsub('$','')} #le gsub retire remplace le dollar par un espace
        p my_hash=nomcrypto.zip(val_without_dollar).to_h #hash des crypto et valeur
  
end


def refresh_each_hour
    t = Time.now #Temps qui va rester figé
    while 0
      t1 = Time.now #Temps qui s'actualise
      if t1.min == t.min && t1.sec == t.sec #Si les minutes et secondes sont égales
        p  get_crypto_value                   #alors on est rendu à l'heure d'après
      end
    end
  end
  
  refresh_each_hour