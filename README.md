# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

-------------------------------------------------------------------------------

## users table
| Column   | Type    | Options                                |
|:--------:|:-------:|:--------------------------------------:|
| name     | string  | index: true, null: false, unique: true |
| email    | string  | null: false                            |

### Association
+ has_many :applies

-------------------------------------------------------------------------------

## profiles table
| Column          | Type                 | Options                        |
|:---------------:|:--------------------:|:------------------------------:|
| image           | string               |                                |
| birthday        | string               | null: false                    |
| sex             | string               | null: false                    |
| phone_number    | string               | null: false                    |
| address         | string               | null: false                    |
| job_experience  | text                 | null: false                    |
| trip_experience | text                 | null: false                    |
| skils           | text                 | null: false                    |
| activity        | text                 | null: false                    |
| introduction    | text                 | null: false                    |
| user_id         | references :user     | null: false, foreign_key: true |
| category_id     | references :category | null: false, foreign_key: true |

### Association
+ belongs_to :user
+ has_many :categories, through: profile_category
+ has_many :tags, through: profile_tag

-------------------------------------------------------------------------------

## categories table
| Column      | Type       | Options                         |
|:-----------:|:----------:|:-------------------------------:|
| name        | string     | null: false                     |

### Association
+ has_many :profiles, through: profile_category
+ has_many :works, through: work_category

-------------------------------------------------------------------------------

## profile_category table
| Column      | Type       | Options                         |
|:-----------:|:----------:|:-------------------------------:|
| profile_id  | string     | null: false, foreign_key: true  |
| category_id | string     | null: false, foreign_key: true  |

### Association
+ belongs_to :profile
+ belongs_to :category

-------------------------------------------------------------------------------

## work_category table
| Column      | Type                 | Options                        |
|:-----------:|:--------------------:|:------------------------------:|
| category_id | references :category | null: false, foreign_key: true |
| work_id     | references :work     | null: false, foreign_key: true |

### Association
+ belongs_to :offer
+ belongs_to :category

-------------------------------------------------------------------------------

## tags table
| Column      | Type       | Options                         |
|:-----------:|:----------:|:-------------------------------:|
| name        | string     | null: false                     |

### Association
+ has_many :profiles, through: profile_tag
+ has_many :works, through: work_tag

-------------------------------------------------------------------------------

## profile_tag table
| Column      | Type                | Options                         |
|:-----------:|:-------------------:|:-------------------------------:|
| profile_id  | references :profile | null: false, foreign_key: true  |
| tag_id      | references :tag     | null: false, foreign_key: true  |

### Association
+ belongs_to :profile
+ belongs_to :category

-------------------------------------------------------------------------------

## work_tag table
| Column      | Type             | Options                        |
|:-----------:|:----------------:|:------------------------------:|
| tag_id      | references :tag  | null: false, foreign_key: true |
| work_id     | references :work | null: false, foreign_key: true |

### Association
+ belongs_to :work
+ belongs_to :tag

-------------------------------------------------------------------------------

## candidates table
| Column     | Type                | Options                        |
|:----------:|:-------------------:|:------------------------------:|
| work_id    | references :work    | null: false, foreign_key: true |
| user_id    | references :user    | null: false, foreign_key: true |

### Association
+ belongs_to :user
+ belongs_to :work

-------------------------------------------------------------------------------

## works table
| Column     | Type                | Options                        |
|:----------:|:-------------------:|:------------------------------:|
| detail     | text                |                                |
| content    | text                |                                |
| money      | text                |                                |
| headcount  | string              |                                |
| span       | string              |                                |
| area       | string              |                                |
| company_id | references :company | null: false, foreign_key: true |

### Association
+ belongs_to :company
+ has_many :categories, through: work_category
+ has_many :tags, through: work_tag

-------------------------------------------------------------------------------

## companies table
| Column      | Type           | Options                        |
|:-----------:|:--------------:|:------------------------------:|
| name        | string         | null: false, unique: true      |
| email       | string         | null: false                    |

### Association
+ has_many :works

-------------------------------------------------------------------------------

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
