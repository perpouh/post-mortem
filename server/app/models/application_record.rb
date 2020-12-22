# これ自動生成なのにrubocop引っかかるの釈然としない
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
