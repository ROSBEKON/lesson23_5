if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/result_print'
require_relative 'lib/test'
result_print = ResultPrint.new
test = Test.new

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

result_print.result_print(test.test_questions(questions), answers)
