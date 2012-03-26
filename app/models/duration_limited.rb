module DurationLimited
  def find(code, date)
    record = self.where(code: code).
      where("started_on <= ? AND (ended_on >= ? OR ended_on IS NULL)", date, date).first
    raise ActiveRecord::RecordNotFound unless record
    record
  end
end
