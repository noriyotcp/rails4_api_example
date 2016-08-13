50.times do
  address = Gimei.address
  User.create(name: Gimei.kanji, addr1: address.prefecture.kanji, addr2: address.city.kanji + address.town.kanji)
end
