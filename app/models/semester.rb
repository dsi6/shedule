#encoding:utf-8
class Semester < ActiveRecord::Base
has_many :groups

validates :year, :presence => true, :inclusion => {:in => 1990..2050}
validates :wcount, :presence => true

def er
errors.add(:data_finish, "Не правильная разница между датами")
end

  def osem
    semnum? ? 'осенний семестр' : 'весенний семестер'
  end
  
end
