class Sentence < ActiveRecord::Base
  belongs_to :criminal
  belongs_to :prison
end
