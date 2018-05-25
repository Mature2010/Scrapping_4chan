require 'nokogiri'
require 'open-uri'

puts "Insert url: "
url = gets.chomp

imagenes = []
i = 0

  document = Nokogiri::HTML(open(url))
  div_main = document.css('div.postContainer.replyContainer')

  div_main.css('div.file').each do |post|
    imagenes[i] = 'https:' + post.css('a.fileThumb').attr('href')
    i += 1
  end

imagenes.each do |direccion|
  system("curl -O #{direccion}")
end
