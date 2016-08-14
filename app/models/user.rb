class User < ActiveRecord::Base
  acts_as_paranoid

  scope :name_like, ->(name) { where('name like ?', "%#{name}%") if name.present? }
  scope :by_addr1, -> (addr) { where(addr1: addr) if addr.present? }
  scope :addr2_like, -> (addr) { where('addr2 like ?', "%#{addr}%") if addr.present? }
end
