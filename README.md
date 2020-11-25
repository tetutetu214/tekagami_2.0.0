# テーブル設計

## users テーブル
| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |

### Association
- has_many :preps
- has_many :tasks
- has_many :actives
- has_many :reviews


## preps テーブル
| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| now                   | string     | null: false       |
| target                | string     | null: false       |
| user                  | references | foreign_key: true |

### Association
- belongs_to :user
- has_many   :tasks
- has_many   :actives
- has_many   :reviews


## tasks テーブル
| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| task_1             | text       | null: false       |
| task_2             | text       | null: false       |
| task_3             | text       | null: false       |
| user               | references | foreign_key: true |
| prep               | references | foreign_key: true |

- belongs_to :user
- belongs_to :prep
- has_many   :actives
- has_many   :reviews

## actives テーブル
| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| way_1              | text       | null: false       |
| way_2              | text       | null: false       |
| way_3              | text       | null: false       |
| user               | references | foreign_key: true |
| prep               | references | foreign_key: true |
| task               | references | foreign_key: true |

- belongs_to :user
- belongs_to :prep
- belongs_to :tasks
- has_many   :reviews

## reviews テーブル
| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| way_1              | text       | null: false       |
| way_2              | text       | null: false       |
| way_3              | text       | null: false       |
| user               | references | foreign_key: true |
| prep               | references | foreign_key: true |
| task               | references | foreign_key: true |

- belongs_to :user
- belongs_to :prep
- belongs_to :tasks
- belongs_to :active
