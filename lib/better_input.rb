module BetterInput
  def self.input(question = nil, show_response: false, type: "string")
    unless question.nil?
      puts question
    end

    loop do
      var = gets.chomp

      case type
      when "int"
        begin
          var = Integer(var)
        rescue ArgumentError
          puts "Err: Please, type a (integer) number."
          next
        end
      when "float"
        begin
          var = Float(var)
        rescue ArgumentError
          puts "Err: Please, type a (float) number."
          next
        end
      when "bool"
        if var.downcase == "true"
          var = true
        elsif var.downcase == "false"
          var = false
        else
          puts "Err: Please, type 'true' or 'false'."
          next
        end
      end

      if show_response
        puts "User Response: #{var}"
      end
      return var
    end
  end
end

