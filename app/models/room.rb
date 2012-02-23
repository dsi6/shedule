#encoding:utf-8
class Room < ActiveRecord::Base
has_many :items

validates :rname, :presence=>true
validates :audience, :presence=>true

end
