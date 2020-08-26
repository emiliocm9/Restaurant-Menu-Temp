class Menu < ApplicationRecord
  has_one_attached :desert
  has_one_attached :breakfast
  has_one_attached :cena
  has_one_attached :comida
  has_one_attached :bebida
  has_one_attached :llevar
end
