class ReviewMailer < ActionMailer::Base
  default from: "cat-gods@caturday-funtime.herokuapp.com"

  def new_review(review)
    @url = cat_path(@review.cat_id)
    mail(to: review.cat.user.email, subject: 'Oh hay, sum 1 reviewed ur cat!')
  end
end
