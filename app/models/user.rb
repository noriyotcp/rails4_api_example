class User < ActiveRecord::Base
  scope :name_like, ->(name) { where('name like ?', "%#{name}%") if name.present? }
  scope :by_addr1, -> (addr1) { where(addr1: addr1) if addr1.present? }
  scope :by_addr2, -> (addr2) { where(addr2: addr2) if addr2.present? }
end
