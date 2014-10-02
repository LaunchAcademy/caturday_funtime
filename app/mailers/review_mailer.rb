class ReviewMailer < ActionMailer::Base
  default from: "caturdayfuntime@gmail.com"

  add_template_helper(ApplicationHelper)

  def new_review(review)
    @review = review
    @cat = review.cat
    @reviewer = review.user
    @creator = review.cat.user

    if @reviewer != @creator
      mail(
        to: @creator.email,
        subject: "#{@reviewer.email} commented on your submission.")
    end
  end
end
