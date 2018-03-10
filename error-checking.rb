def check_syntax(str)
  openables = {
    "(" => ")",
    "[" => "]",
    "{" => "}",
    "<" => ">"
  }
  open = []
  opening_chars = openables.keys
  # opening char is [ "(", "[", "{"]
  closing_chars = openables.values
  #closing char is [ ")", "]", "}"]
  str.each_char do |char|

    if opening_chars.include?(char) # opening bracket

      open << char

    elsif closing_chars.include?(char) # closing bracket

      required_char = openables[open.last]

      if char == required_char # it's the right kind of closing bracket

        open.pop

      else

        if open.any? # it's the wrong kind of closing bracket
          if open.length > 1
            puts "*You have a syntax error: there is an unexpected #{char} where there should be a #{required_char}"
          else
            puts "* You have a syntax error: there is an unexpected #{char}"
          end

        else # there's nothing to close
          puts "* You have a syntax error: there is an unexpected #{char} where there is nothing to close."
        end

        return false

      end

    end
  end

  if open.any?
    required_char = openables[open.first]
    puts "* You have a syntax error: the string ended without a closing #{required_char}"
  end

  return open.empty?
end

puts check_syntax("(this)[] is some text")
puts "*****"
puts check_syntax("(this)] is some text")
puts "*****"
puts check_syntax("[(this] is some text")
# * You have a syntax error: there is an unexpected ] where there should be a )
# false
puts "*****"
puts check_syntax("[this][ is some text")
puts "*****"
puts check_syntax("[this] is some text")
puts "*****"
puts check_syntax("<html> (this)[] is some text</html>")
puts "*****"
puts check_syntax("<html> (this)] is some text</html>")
puts "*****"
puts check_syntax("<html> [(this] is some text</html>")
puts "*****"
puts check_syntax("<html> [this][ is some text</html")
puts "*****"
puts check_syntax("<html> [this] is some text</html")
puts "*****"
