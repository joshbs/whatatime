class Service < ActiveRecord::Base
  has_many :settings, :as => :settable, :autosave => true
  accepts_nested_attributes_for :settings, :allow_destroy => true
end
