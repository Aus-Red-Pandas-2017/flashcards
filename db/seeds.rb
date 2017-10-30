# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

module LoadDeck
  def self.parser(filename)
    questions =[]
    answers =[]
    file_path = Rails.root.to_s + "/db/source/#{filename}"
    File.open(file_path).each do |line|
      if line.split("").include?("?")
           questions << line.chomp
      else
        answers << line.chomp if !line.empty?
      end
    end
    answers.delete("")
    questions.zip(answers).to_h
  end
end

deck1 = Deck.create( {name: "Raccoons"} )
deck2 = Deck.create( {name: "Otters" })
deck3 = Deck.create( { name: "Nighthawks" })

racoon_deck = LoadDeck.parser("raccoon.txt")
otter_deck = LoadDeck.parser("otter.txt")
nighthawk_deck = LoadDeck.parser("nighthawk.txt")

racoon_deck.each do |card|
  card_obj = Card.create({ :question => card[0], :answer => card[1]})
  card_obj.deck_id = deck1.id
  card_obj.save
end

otter_deck.each do |card|
  card_obj = Card.create({ :question => card[0], :answer => card[1]})
  card_obj.deck_id = deck2.id
  card_obj.save
end

nighthawk_deck.each do |card|
  card_obj = Card.create({ :question => card[0], :answer => card[1]})
  card_obj.deck_id = deck3.id
  card_obj.save
end
