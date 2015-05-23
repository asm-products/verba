module DateFormat
  extend ActiveSupport::Concern

  included do

    def date(without_year: false)
      if without_year
        created_at.strftime("%e %B")
      else
        created_at.strftime("%e %B %Y")
      end
    end

  end
end
