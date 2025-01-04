class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.last_by(*attributes)
    order(*attributes.map { |attribute| { attribute => :desc } }).first
  end

  def self.first_by(*attributes)
    order(*attributes).first
  end
end
