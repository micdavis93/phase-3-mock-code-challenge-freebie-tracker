class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    if self.freebies.find_by(item_name: item_name)
      true   # return true if find_by returns a nonzero amount of freebie instances
    else
      false   # return false if find_by returns nil
    end
  end

  def give_away(dev, freebie)
    if self.id = freebie.dev_id   # if giver actually owns the freebie
      freebie.dev_id = dev.id   # assign freebie's dev_id to that of the recipient dev
      freebie.save   # persists to database
    end
  end
end
