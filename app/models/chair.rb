#encoding:utf-8
class Chair < ActiveRecord::Base
has_many :teachers

validates :chnum, :presence => true, :length=>{:minimum=>1, :maximum=>4}
validates :chname, :presence => true
end
