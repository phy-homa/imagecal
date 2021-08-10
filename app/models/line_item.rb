class LineItem < ApplicationRecord

belongs_to :image
belongs_to :cart
belongs_to :calendar
end
