puts 'Deleting consonants'
Consonant.delete_all

high_class_consonants = %w(ข ฃ ฉ ฐ ถ ผ ฝ ศ ษ ส ห)
high_class_consonants.each do |c|
  Consonant.create consonant: c, consonant_class: 'high'
end

middle_class_consonants = %w(ก จ ด ฎ ฏ ต บ ป อ)
middle_class_consonants.each do |c|
  Consonant.create consonant: c, consonant_class: 'middle'
end

low_class_consonants = %w(ง ณ น ม ญ ย ร ล ฬ ว ค ฅ ฆ ช ฌ ฑ ฒ ท ธ พ ภ ฟ ซ ฮ)
low_class_consonants.each do |c|
  Consonant.create consonant: c, consonant_class: 'low'
end

puts 'High class consonants:'
puts Consonant.where(consonant_class: 'high').length

puts 'Middle class consonants:'
puts Consonant.where(consonant_class: 'middle').length

puts 'Low class consonants:'
puts Consonant.where(consonant_class: 'low').length
