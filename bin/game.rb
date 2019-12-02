class Game
    attr_reader :board, :player1, :player2
    attr_writer :board, :player
    def initialize(player1, player2)
      @player1 = player1
      @player2 = player2
      @playing = true
      @player = nil
      @board = Board.new
    end
  
    def play
      puts @board.start_display(@player1, @player2)
      @player = @player1
      while @playing
        puts @board.display
        puts "#{@player.name} It is your turn to play"
        puts
  
        player_move
  
        if a_win?
          @player.wins += 1
          puts @board.display
          puts @board.win_display(@player, @player1, @player2)
          @playing = false
  
        end
  
        game_end
        turn
      end
    end
  
    def player_move
      moves_error = true
      while moves_error
        puts 'Select a move from the available moves: '
        puts @board.availables
        num = gets.chomp.to_i
        num -= 1
        if move_ok?(num)
          moves_error = false
          @board.moves[num] = @player.symbol
          puts "#{@player.name} has played the move at #{num + 1}"
        else
         puts errors('invalid_num')
        end
  
      end
    end

    def move_ok?(num)
      if num >= 0 && num <= 8
        num_ok = @board.available?(num)
        if num_ok
          return true
        end        
      end
      return false
    end
  
    def turn
      
      @player = if @player.number == @player1.number
                  @player2
                else
                  @player1
                end
    end
  
    def game_end
      if draw?
        @playing = false
        @board.display
        puts @board.draw_display
      end
      play_again unless @playing
    end

    def draw?
      if @playing && @board.full?
        return true
      end
      false
    end
  
    def play_again
      puts 'Play Again? Y for Yes or N for No?'
      not_answered = true
      while not_answered
        answ = gets.chomp.downcase
        if answ.to_s == 'y'
          @board.reset
          @playing = true
          not_answered = false
          puts "Great! Let's Play Again"
          play
        elsif answ.to_s == 'n'
          puts @board.start_display(@player1, @player2)
          puts 'Thank you for playing! See you next time! :-)'
          puts
          not_answered = false
        else
          puts 'Please type Y or N'
  
        end
      end
    end
  
    def a_win?
      wins = []
      wins << @board.moves[0].to_s + @board.moves[1].to_s + @board.moves[2].to_s
      wins << @board.moves[3].to_s + @board.moves[4].to_s + @board.moves[5].to_s
      wins << @board.moves[6].to_s + @board.moves[7].to_s + @board.moves[8].to_s
      wins << @board.moves[0].to_s + @board.moves[3].to_s + @board.moves[6].to_s
      wins << @board.moves[1].to_s + @board.moves[4].to_s + @board.moves[7].to_s
      wins << @board.moves[2].to_s + @board.moves[5].to_s + @board.moves[8].to_s
      wins << @board.moves[0].to_s + @board.moves[4].to_s + @board.moves[8].to_s
      wins << @board.moves[2].to_s + @board.moves[4].to_s + @board.moves[6].to_s
  
      player1_win = 'XXX'
      player2_win = 'OOO'
      wins.each do |x|
        return true if x == player1_win || x == player2_win
      end
      false
    end
  
    def errors(code)
      errors = {
        invalid_num: "Sorry. Your move is not available. Please try again \n"
      }
  
      if errors[code.to_sym]
        return errors[code.to_sym]
      else
        return 'Oops! error code not found!'

      end
    end
end