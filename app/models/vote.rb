class Vote < ApplicationRecord
  belongs_to :occurrence
  belongs_to :user
end
