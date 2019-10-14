class TurkeyCap < ApplicationRecord
  establish_connection "e21prod".to_sym
  validates :dc, presence: true
  validates :channel, presence: true
  validates :part, presence: true
  validates :cap, presence: true
  validate :cap_minimum

  def cap_minimum
    # read turkey tote(holidaybirds) record for this cap. If the cap is less than the harvest reject
    h = Holidaybird.find_by cc: dc, channel: channel, sku: part
    if h.blank?
      errors.add(:dc, "channel, part combination not in Tote")
    else
      if !h.harvest.blank?
        # we have a harvest for this dc, channel, part combination. Make sure the cap is not less.
        if cap < h.harvest
          errors.add(:cap, "cannot be less than Tote harvest. Tote harvest = "+h.harvest.to_s)
        end
      end
    end
  end

  def self.import(file)
    TurkeyCap.delete_all
    CSV.foreach(file.path, headers:true) do |row|
      TurkeyCap.create! row.to_hash
    end
  end

end
