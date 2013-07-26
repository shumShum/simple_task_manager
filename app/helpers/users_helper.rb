module UsersHelper
end

def word_count(str)
  state = OUTSIDE_WORD 
  i = 0
  count = 0
  while(str[i] != '\n') do

    # поведение
    case state
    when INSIDE_WORD
      if is_letter?(str[i])
        # ничего не делаем
      end
      if is_space?(str[i])
        state = OUTSIDE_WORD
        count += 1
      end
    when OUTSIDE_WORD
      if is_letter?(str[i])
        state = INSIDE_WORD
      end
      if is_space?(str[i])
        # ничего не делаем
      end
    end

    i += 1 
  end
  count
end

# события
def is_letter?(c)
  c =~ /\w/
end

def is_space?(c)
  c == ' '
end