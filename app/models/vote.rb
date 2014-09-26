class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true

  #validations for uniqueness etc.
end
