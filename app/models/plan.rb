#encoding:utf-8
class Plan < ActiveRecord::Base
belongs_to :group
has_many :courses

validates :id, :presence=>true

end
