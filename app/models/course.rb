#encoding:utf-8
class Course < ActiveRecord::Base
has_one :plan

validates :name, :presence => true, :length=>{:minimum=>4, :maximum=>80}
validates :sname, :presence => true, :length=>{:maximum=>80}
validates :plan_id, :presence => true
validates :fotch, :presence => true
validates :chair_id, :presence => true

end
