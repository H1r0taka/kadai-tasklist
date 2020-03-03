class ApplicationRecord < ActiveRecord::Base
    # ActiveRecord は、Modelの操作を担う
    # Rails と、mysqlを繋ぐ => Ruby の文法でデータベースを操作可能になる
    # プログラミング言語コードでデータベースを操作する手法： ORM( Object-Relational-Mapping )
    
  self.abstract_class = true
end
