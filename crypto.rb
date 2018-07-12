require 'nokogiri'
require 'open-uri'


def get_crypto_value
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    nomcrypto =doc.css('td.no-wrap.currency-name a.currency-name-container.link-secondary').map{ |lien| 
    lien.text }
    valcrypto = doc.css('td > a.price').map{|lien| 
        lien.text }
        val_without_dollar=valcrypto.map{|n| n.gsub('$','')}
        p my_hash=nomcrypto.zip(val_without_dollar).to_h
  #td class="no-wrap currency-name"
end
get_crypto_value