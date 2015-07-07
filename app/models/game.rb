class Game < ActiveRecord::Base
  belongs_to :player, class_name: "User"
  belongs_to :suggester, class_name: "User"
  validates_presence_of :secret_word, :player, :suggester

end
