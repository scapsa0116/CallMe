#### User
* username
* email
* password

    MODELS
    -has_many :jobs
    -has_many :reviews
    -has_many :reviews_jobs, through: :reviews
    -has_many :categories, through: :jpbs*




#### Job
* first name
* last name
* phone number
* email
* job title
* job descriotion
* job category

    MODELS
    -has_many :reviews
    -belongs_to :user
    -has_many :users, throught: reviews
    -belongs_to :category





#### Reviews
* description
* stars

    MODELS
    -belongs_to :user
    -belongs_to :jobs






#### Cathegory
* name

    MODELS
    -has_many :jobs
    -has_many :users, through: :jobs