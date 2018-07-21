#!/usr/local/bin/ruby
require 'nokogiri'
require 'open-uri'

puts "Insert url: "
url = gets.chomp

imagenes = []

  document = Nokogiri::HTML(open(url))
  div_main = document.css('div.postContainer.replyContainer')

  div_main.css('div.file').each do |post|
    imagenes << 'https:' + post.css('a.fileThumb').attr('href')
  end

imagenes.each do |direccion|
  system("curl -O #{direccion}")
end
