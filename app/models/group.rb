#encoding:utf-8
class Group < ActiveRecord::Base
has_one :semesters
has_one :plan
has_many :flows
belongs_to :faculty

validates :numb_gr,:presence => true,:uniqueness => true
validates :gcount, :presence => true, :inclusion => {:in => 10..100}
validates :plan_id, :presence => true
validates :semester_id, :presence => true 
end
