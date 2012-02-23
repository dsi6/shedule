#encoding:utf-8
class Teacher < ActiveRecord::Base
has_many :chairs
has_many :items

validates :name , :presence => true, :inclusion => {:in => 2..30}
validates :sname , :presence => true, :inclusion => {:in => 2..30}
validates :last_name , :presence => true, :inclusion => {:in => 2..30}
validates :tlogin , :presence => true, :inclusion => {:in => 4..30}
end
