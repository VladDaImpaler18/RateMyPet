# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [X] Include at least one has_many relationship (Category has_many :pictures; Comment has_many :comments, as: :commentable, and more!) 
- [X] Include at least one belongs_to relationship (Comment, belongs_to :user; Comment belongs_to :commentable, polymorphic: true [advanced level -- bonus points pls])
- [X] Include at least two has_many through relationships ([1]User has_many :categories, through: :pictures; [2] Category has_many :users, through: :pictures)
- [X] Include at least one many-to-many relationship (User has_many :categories, through: :pictures + Category has_many :users, through: :pictures)
- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (Picture schema includes Title and Description which the user can input--Title is required)
- [X] Include reasonable validations for simple model objects (Picture title, presence: true; Picture custom validation :must_have_image, Comment content, presence: true)
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: http://localhost:3000/comments/5)
- [X] Include signup (Devise)
- [X] Include login (Devise)
- [X] Include logout (Devise)
- [X] Include third party signup/login (Devise/OmniAuth)
- [X] Include nested resource show or index (URL /pictures/16/comments/5, which can be viewed with all comments from /pictures/16, or specfically that comment /comments/5)
- [X] Include nested resource "new" form (FROM /pictures/16 Create a comment. There is no URL direct method to create a comment from that picture)
- [X] Include form display of validation errors (form URL http://localhost:3000/pictures/new, don't input title, category, or image)

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate
