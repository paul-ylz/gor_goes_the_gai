puts 'Deleting Alphabets'
Alphabet.delete_all

high_class_consonants = %w(ข ฃ ฉ ฐ ถ ผ ฝ ศ ษ ส ห)
high_class_consonants.each do |hcc|
  Alphabet.create alphabet: hcc, consonant_attributes: { consonant_class: 'high' }
end

middle_class_consonants = %w(ก จ ด ฎ ฏ ต บ ป อ)
middle_class_consonants.each do |mcc|
  Alphabet.create alphabet: mcc, consonant_attributes: { consonant_class: 'middle' }
end

low_class_consonants = %w(ง ณ น ม ญ ย ร ล ฬ ว ค ฅ ฆ ช ฌ ฑ ฒ ท ธ พ ภ ฟ ซ ฮ)
low_class_consonants.each do |lcc|
  Alphabet.create alphabet: lcc, consonant_attributes: { consonant_class: 'low' }
end

puts "#{high_class_consonants.length} high class consonants"
puts "#{middle_class_consonants.length} middle class consonants"
puts "#{low_class_consonants.length} low class consonants"
