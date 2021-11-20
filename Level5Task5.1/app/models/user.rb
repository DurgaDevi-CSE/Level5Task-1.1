#class User < ApplicationRecord
#end

class User < ActiveRecord::Base
  def to_details_string
    "#{id}. #{name} #{email}"
  end
end
