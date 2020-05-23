class Post < ApplicationRecord
    validates :post_name, presence: true
    validates :post_content, presence: true
    validates :post_old, presence: true
    validates :post_job, presence: true
    validates :post_email, presence: true
    validates :post_id, presence: true
    validates :post_sex, presence: true

end
