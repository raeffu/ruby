require 'rexml/document'
include REXML

file = File.new("bibliography.xml")
doc = Document.new(file)

puts doc
