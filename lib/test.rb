class Test
  def initialize
    @user_total = 0
  end

  def test_questions(questions)
    questions.each do |question|
      input_user = nil
      puts question

      until input_user == 1 || input_user == 2 || input_user == 3
        puts "используйте три варианта ответов - да = 1, иногда = 2 и нет = 3"
        input_user = STDIN.gets.to_i
      end

      if input_user == 1
        @user_total += 2
      elsif input_user == 2
        @user_total += 1
      end
    end

    return @user_total
  end
end
