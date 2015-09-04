require 'asciiart'
require 'artii'
require 'csv'

module PictureLoader
  def self.get_pics_from_csv(filepath)
    array_of_pics = []
    CSV.foreach(filepath) do |row|
      array_of_pics << Picture.new(row[0], row[1], row[2], row[3], row[4])
    end
   array_of_pics
  end
end

class Picture
  attr_reader :name, :name, :name2, :name3, :name4, :url
  def initialize(name, name2, name3, name4, url)
    @name = name
    @name2 = name2
    @name3 = name3
    @name4 = name4
    @url = url
  end
end

def generate_random_pic
  PictureLoader.get_pics_from_csv("landmarks.csv").sample
end

counter = 0
wrong_count = 0
system("clear")
a = Artii::Base.new
b = Artii::Base.new :font => 'acrobatic'
puts a.asciify('Welcome to New York City, Rookie!')
sleep (0.5)
puts "You just landed on Ellis Island, let's see if you can navigate around like a real New Yorker."
puts "Your task is to name the landmarks, and we'll keep a tally. If you get 5 right, you win!!! You ready? (Type y/n or quit to quit)"
ready = gets.chomp.downcase
if ready == 'yes' || ready == 'y'
  puts "Here is the first one:"
  while counter < 5 do
    pics = generate_random_pic
   # require 'pry';binding.pry
    random_pic_display = AsciiArt.new(pics.url)
    puts random_pic_display.to_ascii_art(color: true)
    puts "What do you think this is?"
    guess = gets.chomp.downcase
    if guess == "quit"
      abort('See ya later, Rookie')
    end
      if guess == pics.name || guess == pics.name2 || guess == pics.name3 || guess == pics.name4
        counter += 1
        puts "Nice work! You've got #{counter} right. #{5 - counter} to go."
        sleep(2)
        system("clear")
      else
        wrong_count += 1
        puts "You're terrible rookie. Try again or GTFO! This is how many times you've been wrong: #{wrong_counter}"
        sleep(2)
        system("clear")
      end
      if counter == 5
        system("clear")
        puts b.asciify('You WIN!!!')
        sleep(4)
      end

  end
end


