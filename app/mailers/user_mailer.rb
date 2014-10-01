class UserMailer < ActionMailer::Base
  default from: "cat-gods@caturday-funtime.herokuapp.com"

  def new_review
    @user = current.user
    @url = cat_path(@review.cat_id)
    mail(to: @user.email, subject: 'Oh hay, sum 1 reviewed ur cat!')
  end
end
