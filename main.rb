class Player
  attr_accessor :health, :questionNumber
  attr_reader :playerName

  def initialize playerName
    @playerName = playerName
    @health = 3
  end

  def guess answer, opponent
    if answer == opponent.questionNumber.to_s
      puts opponent.playerName + ": Yes! you are correct"
    else
      puts opponent.playerName + ": Seriuously? No!"
      self.health = self.health - 1
    end
  end

  def question opponent
    number1 = 0
    number2 = 0
    while ![*1..20].include?(number1)
      puts self.playerName + ", pick a number between 1 to 20"
      number1 = gets.chomp.to_i
    end
    while ![*1..20].include?(number2)
      puts self.playerName + ", pick another number between 1 to 20"
      number2 = gets.chomp.to_i
    end
    puts opponent.playerName + ", What does #{number1} plus #{number2} equal?"
    @questionNumber = number1 + number2
  end

  def score opponent
    puts "The score is #{self.playerName}: #{self.health}/3, #{opponent.playerName}: #{opponent.health}/3"
    puts "=======Next Turn======"
  end

end

puts "what is player 1's name?"
name1 = gets.chomp

puts "what is player 2's name?"
name2 = gets.chomp

player1 = Player.new name1
player2 = Player.new name2

while player1.health > 0 and player2.health > 0
  player1.question player2
  answer = gets.chomp
  player2.guess answer, player1
  player1.score player2
  player2.question player1
  answer = gets.chomp
  player1.guess answer, player2
  player1.score player2
end

puts "game over #{player1.playerName}'s heath is #{player1.health} and #{player2.playerName}'s health is #{player2.health}."