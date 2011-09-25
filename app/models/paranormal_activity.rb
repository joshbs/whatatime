class ParanormalActivity < ActiveRecord::Base
  belongs_to :time_entry
  belongs_to :service
end
