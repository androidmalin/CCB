class Serie < ActiveRecord::Base
  has_many :episodes, :foreign_key => :serie_id
end
