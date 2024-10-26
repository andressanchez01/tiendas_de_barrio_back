module ProductsHelper
  def simple_description(description)
    description.truncate(100)
  end

  def date_format(date)
    months = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"]
    month = months[date.strftime('%m').to_i - 1]
    day = date.strftime("%d")
    year = date.strftime("%Y")
    "#{day} del #{month} del #{year}"
  end
end
