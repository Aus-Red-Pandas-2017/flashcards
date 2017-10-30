class Deck < ApplicationRecord
  has_many :rounds
  has_many :cards
end