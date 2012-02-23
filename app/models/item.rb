#encoding:utf-8
class Item < ActiveRecord::Base

has_many :rooms
has_one :flow
has_many :teacher

validates :flow_id, :presence=>true
validates :room_id, :presence=>true
validates :itype, :presence=>true
validates :inum, :presence=>true
validates :wday, :uniqueness => true


end
