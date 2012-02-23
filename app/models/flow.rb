#encoding:utf-8
class Flow < ActiveRecord::Base
belongs_to :item
has_many :groups 

validates :group_id, :presence=>true

  attr_reader :group_tokens

  def group_tokens=(ids)
    self.group_ids = ids.split(",")
  end

end
