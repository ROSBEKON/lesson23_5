if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts "Тест содержит возможность определить уровень коммуникабельности человека.\n" \
     "Отвечать на вопросы следует используя три варианта ответа \n" \
     "да = 1, иногда = 2 и нет = 3"


current_path = File.dirname(__FILE__)
file_anser = current_path + "/data/anser.txt"
file_question = current_path + "/data/question.txt"

if File.exist?(file_anser)
  f = File.new(file_anser, "r:UTF-8")
  answers = f.readlines
  f.close
else
  abort "файл anser.txt по такому пути #{file_anser} не найден ..."
end

if File.exist?(file_question)
  f = File.new(file_question, "r:UTF-8")
  questions = f.readlines
  f.close
else
  abort "файл question.txt по такому пути #{file_question} не найден ..."
end

user_total = 0
questions.each do |question|

  input_user = nil

  puts question

  until input_user == 1 || input_user == 2 || input_user == 3
    puts "используйте три варианта ответов - да = 1, иногда = 2 и нет = 3"
    input_user = STDIN.gets.to_i
  end

  if input_user == 1
    user_total += 2
  elsif input_user == 2
    user_total += 1
  end

end

puts
puts "Ваш результат теста:"
puts

if user_total >= 30 and user_total <= 32
  puts answers[0].to_s
elsif user_total >= 25 and user_total <= 29
  puts answers[1].to_s
elsif user_total >= 19 and user_total <= 24
  puts answers[2].to_s
elsif user_total >= 14 and user_total <= 18
  puts answers[3].to_s
elsif user_total >= 9 and user_total <= 13
  puts answers[4].to_s
elsif user_total >= 4 and user_total <= 8
  puts answers[5].to_s
else
  puts answers[6].to_s
end
