class Search
  include ActiveModel::Validations

  validate :check_st_uniq, on: :find

  def check_st_uniq
    errors.add(:end_station, "станции должны отличаться") if params[:end_station] == params[:start_station]
  end

end
