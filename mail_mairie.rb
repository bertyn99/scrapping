require 'nokogiri'
require 'open-uri'


def get_the_email_of_a_townhal_from_its_webpage(url)
    doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{url}"))
   doc.css('tr.txt-primary.tr-last > td')[7].text
    
end



def get_all_the_urls_of_val_doise_townhalls(url)
    doc = Nokogiri::HTML(open(url))
    
     url= doc.css('p > a').map{ |lien| 
       lien['href'] }
    name=doc.css('p > a').map{ |lien| 
        lien.text }
     return [url,name]
end



def get_annuaire_of_city_mail
  
 array = get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")
email=array[0].map{|lien| get_the_email_of_a_townhal_from_its_webpage(lien)}# tableau des email des maires de val d'oise
name=array[1]
annuaire=[] # initialisation du hash vide
i=0# initialisation du compteur 
array[1].map do

    annuaire+=[{ "name" =>name[i], "email" =>email[i]}]
    i+=1# in crémentation du compteur a chaque tour de la boucle
end
p annuaire
end
get_annuaire_of_city_mail