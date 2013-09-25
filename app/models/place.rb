class Place < ActiveRecord::Base
  # before_create :default_values
  belongs_to :user

  private
    def default_values
      puts "default values woop!"
      puts self.done
      # self.name = "Thomas"
    end
end
