# これは、Taskモデルファイルです！
# マイグレーションファイル実行後に使用可能
    # Application Recordクラスを継承
    # Task < Application Record < ActiveRecord::Base(継承順)
    # ActiveRecord::Base に、require,extend,includeが指定してあり、task.rbもそれらのモデル操作が可能になる

class Task < ApplicationRecord
    validates :content, presence: true, length: { maximum: 255 }
    calidates :status, presence: true, length: { maximun: 255 }
end
