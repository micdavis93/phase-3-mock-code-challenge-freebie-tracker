class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev, item_name, value)
    ### one way to grab freebies associated with this company instance, and then create a new freebie instance based on the arguments passed into method invocation
    self.freebies.create(dev: dev, company: self, item_name: item_name, value: value)

    ### another way, using the more specific id's rather than the whole dev/company instances
    ### item_name and value are no different, nor should they be
    # self.freebies.create(dev_id: dev.id, company_id: self.id, item_name: item_name, value: value)
  end

  def self.oldest_company
    ### this is one way
    self.all.min_by{|company| company.founding_year}
    
    ### this is another way
    # self.all.max_by{|company| 2004 - company.founding_year}

    ### this is another way
    # self.all.order(:founding_year).first

    ### and this is even another way
    # self.all.order(founding_year: :desc).last
  end
end
