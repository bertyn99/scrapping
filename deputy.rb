require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_deputy_from_its_webpage(url)
    doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{url}"))
  return doc.css('dd')[3].css('ul >li >a').map{|d|  d['href'].gsub('mailto:','')}
end

#get_the_email_of_a_townhal_from_its_webpage("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA724827")

def get_all_the_urls_of_deputy(url)
    doc = Nokogiri::HTML(open(url))
    
     url= doc.css('ul.col3> li> a').map{ |lien| 
       lien['href'] }
  deputy=doc.css('ul.col3> li> a').map{ |lien| 
        lien.text }
    return[deputy,url]

end
#get_all_the_urls_of_deputy("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")

def get_annuaire_of_deputy
  
    array = get_all_the_urls_of_deputy("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")
   email=array[1].map{|lien| get_the_email_of_a_deputy_from_its_webpage(lien)}
   deputy=array[0]
   annuaire=[]
   i=0
   array[1].map do
   
       annuaire+=[{ "NameDeputy" =>deputy[i], "email" =>email[i]}]
       i+=1
   end
   p annuaire
   end
   get_annuaire_of_deputy
   