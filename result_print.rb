class ResultPrint
  def result_print(user_total, answers)
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
  end
end
