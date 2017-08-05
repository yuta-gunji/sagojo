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
| Column          | Type           | Options                                |
|:---------------:|:--------------:|:--------------------------------------:|
| name            | string         | index: true, null: false, unique: true |
| email           | string         | null: false                            |
| password        | string         | null: false                            |
| image           | string         |                                        |
| birthday        | string         |                                        |
| sex             | string         |                                        |
| phone_number    | string         |                                        |
| division        | string         |                                        |
| municipality    | string         |                                        |
| address         | string         |                                        |
| job_experience  | text           |                                        |
| trip_experience | text           |                                        |
| skills          | text           |                                        |
| activity        | text           |                                        |
| introduction    | text           |                                        |

### Association
+ has_many :works, through: candidates
+ has_many :categories, through: user_categories
+ has_many :tags, through: user_tags

-------------------------------------------------------------------------------

## categories table
| Column      | Type       | Options                           |
|:-----------:|:----------:|:---------------------------------:|
| name        | string     | null: false, unique: true         |

### Association
+ has_many :users, through: user_categories
+ has_many :works, through: work_categories

-------------------------------------------------------------------------------

## user_category table
| Column      | Type                  | Options                         |
|:-----------:|:---------------------:|:-------------------------------:|
| user_id     | references :user      | null: false, foreign_key: true  |
| category_id | references :category  | null: false, foreign_key: true  |

### Association
+ belongs_to :user
+ belongs_to :category

-------------------------------------------------------------------------------

## work_category table
| Column      | Type                 | Options                        |
|:-----------:|:--------------------:|:------------------------------:|
| work_id     | references :work     | null: false, foreign_key: true |
| category_id | references :category | null: false, foreign_key: true |


### Association
+ belongs_to :work
+ belongs_to :category

-------------------------------------------------------------------------------

## tags table
| Column      | Type       | Options                         |
|:-----------:|:----------:|:-------------------------------:|
| name        | string     | null: false, unique: true       |

### Association
+ has_many :users, through: user_tags
+ has_many :works, through: work_tags

-------------------------------------------------------------------------------

## user_tags table
| Column      | Type                | Options                         |
|:-----------:|:-------------------:|:-------------------------------:|
| user_id     | references :user    | null: false, foreign_key: true  |
| tag_id      | references :tag     | null: false, foreign_key: true  |

### Association
+ belongs_to :user
+ belongs_to :tag

-------------------------------------------------------------------------------

## work_tags table
| Column      | Type             | Options                         |
|:-----------:|:----------------:|:-------------------------------:|
| tag_id      | references :tag  | null: false, foreign_key: true  |
| work_id     | references :work | null: false, foreign_key: true  |

### Association
+ belongs_to :work
+ belongs_to :tag

-------------------------------------------------------------------------------

## candidates table
| Column     | Type                | Options                        |
|:----------:|:-------------------:|:------------------------------:|
| work_id    | references :work    | null: false, foreign_key: true |
| user_id    | references :user    | null: false, foreign_key: true |
| status     | integer             |                                |

### Association
+ belongs_to :user
+ belongs_to :work

-------------------------------------------------------------------------------

## works table
| Column                     | Type                | Options                        |
|:--------------------------:|:-------------------:|:------------------------------:|
| image                      | text                |                                |
| outline                    | text                |                                |
| fee                        | string              |                                |
| qualification_requirements | text                |                                |
| headcount                  | string              |                                |
| span                       | string              |                                |
| area                       | string              |                                |
| recruitment_end_date       | date                |                                |
| company_id                 | references :company | null: false, foreign_key: true |

### Association
+ belongs_to :company
+ has_many :users, through: candidates
+ has_many :categories, through: work_categories
+ has_many :tags, through: work_tags

-------------------------------------------------------------------------------

## companies table
| Column      | Type           | Options                        |
|:-----------:|:--------------:|:------------------------------:|
| name        | string         | null: false, unique: true      |
| email       | string         | null: false                    |
| password    | string         | null: false                    |


### Association
+ has_many :works

-------------------------------------------------------------------------------

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
