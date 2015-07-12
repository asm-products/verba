module DateFormat
  extend ActiveSupport::Concern

  included do

    def date(without_year: false)
      if without_year
        created_at.strftime("%B %eth")
      else
        created_at.strftime("%B %eth, %Y")
      end
    end

  end
end
